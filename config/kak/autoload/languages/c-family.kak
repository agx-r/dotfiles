hook global BufCreate .*\.(c|cats)$ %{
    set-option buffer filetype c
}

hook global BufCreate .*\.(cc|cpp|cxx|C|hh|hpp|hxx|H)$ %{
    set-option buffer filetype cpp
}

hook global BufCreate .*\.h$ %{
    try %{
        execute-keys -draft %{%s\b::\b|\btemplate\h*<lt>|\bclass\h+\w+|\b(typename|namespace)\b|\b(public|private|protected)\h*:<ret>}
        set-option buffer filetype cpp
        } catch %{
        set-option buffer filetype c
    }
}

hook global WinSetOption filetype=(c) %{
    map window goto d '<esc>: cscope-definition<ret>' -docstring 'definition'
    map window goto r '<esc>: cscope-references<ret>' -docstring 'references'
    map window user f ': clang-format<ret>' -docstring 'clang-format -i'
}

define-command cscope-definition %{
	execute-keys '[wf'
	evaluate-commands %sh{
		res=$(cscope -L -1 "$kak_selection" 2>/dev/null | head -n 1)
		if [ -n "$res" ]; then
			set -- $res
			echo "edit '$1' $3; execute-keys x"
		else
			echo "fail '$kak_selection is not in global scope'"
		fi
	}
}

define-command cscope-references %{
	execute-keys '[wf'
	evaluate-commands %sh{
		res=$(cscope -L -3 "$kak_selection" 2>/dev/null)

		if [ -z "$res" ]; then
			echo "fail 'no references for $kak_selection'"
			exit
		fi

		echo "$res" | (
			menu_items=""
			while read -r line; do
				[ -z "$line" ] && continue

				file=$(echo "$line" | cut -d' ' -f1)
				func=$(echo "$line" | cut -d' ' -f2)
				line_num=$(echo "$line" | cut -d' ' -f3)
				text=$(echo "$line" | cut -d' ' -f4-)

				item_name=$(echo "$file:$line_num [$func] $text" | sed "s/'/''/g")
				item_action=$(echo "edit '$file' $line_num; execute-keys x" | sed "s/'/''/g")

				menu_items="$menu_items '$item_name' '$item_action'"
			done
			echo "menu -auto-single $menu_items"
		)
	}
}

define-command clang-format %{
	execute-keys -draft <percent>|clang-format<ret>
}

hook -group c-highlight global WinSetOption filetype=c %{
    add-highlighter window/c ref c
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/c }
}

hook -group cpp-highlight global WinSetOption filetype=cpp %{
    add-highlighter window/cpp ref cpp
    hook -once -always window WinSetOption filetype=.* %{ remove-highlighter window/cpp }
}

evaluate-commands %sh{
    for ft in c cpp; do
        cat << EOF
add-highlighter shared/$ft regions
add-highlighter shared/$ft/code default-region group
add-highlighter shared/$ft/string region %{(?<!')(?<!'\\\\)"} %{(?<!\\\\)(?:\\\\\\\\)*"} fill string
add-highlighter shared/$ft/documentation_comment region /\*(\*[^/]|!) \*/ fill documentation
add-highlighter shared/$ft/line_documentation_comment region //[/!] $ fill documentation
add-highlighter shared/$ft/comment region /\\* \\*/ fill comment
add-highlighter shared/$ft/line_comment region // (?<!\\\\)(?=\\n) fill comment
add-highlighter shared/$ft/disabled region -recurse "#\\h*if(?:def)?" ^\\h*?#\\h*if\\h+(?:0|FALSE)\\b "#\\h*(?:else|elif|endif)" fill comment
add-highlighter shared/$ft/ifdef region %{^\\h*\\K#\\h*(?:define|elif|if)(?=\\h)} %{(?<!\\\\)(?=\\s)|(?=//)} fill meta
add-highlighter shared/$ft/macro region %{^\\h*#} %{(?<!\\\\)(?=\\n)|(?=//)} group
add-highlighter shared/$ft/macro/ regex ^\\h*(#\\h*\\S*) 1:meta
add-highlighter shared/$ft/macro/ regex ^\\h*#\\h*include\\h+(<[^>]*>|"(?:[^"\\\\]|\\\\.)*") 1:module
add-highlighter shared/$ft/macro/ regex /\\*.*?\\*/ 0:comment
EOF
    done
}

add-highlighter shared/c/code/numbers regex %{\b-?(0[xX][0-9a-fA-F]+|\d+)([uU][lL]{0,2}|[lL]{1,2}[uU]?|[fFdDiI]|([eE][-+]?\d+))?|'((\\.)?|[^'\\])'} 0:value
evaluate-commands %sh{
    keywords='asm break case continue default do else for goto if return
              sizeof switch while offsetof alignas alignof'
    attributes='auto atomic const enum extern inline register restrict static
                struct typedef union volatile thread_local'
    types='char double float int long short signed unsigned u8 i8 u16 i16 u32 i32 u64 i64 b8 b16 b32 b64 void
           complex imaginary fenv_t fexcept_t imaxdiv_t lconv
           float_t double_t jmp_buf sig_atomic_t va_list
           memory_order atomic_flag atomic_bool atomic_char atomic_schar atomic_uchar atomic_wchar atomic_short atomic_ushort atomic_int atomic_uint atomic_long atomic_llong atomic_ulong atomic_ullong atomic_char16_t atomic_char32_t atomic_intptr_t atomic_intmax_t atomic_int8_t atomic_int16_t atomic_int32_t atomic_int64_t atomic_int_least8_t atomic_int_least16_t atomic_int_least32_t atomic_int_least64_t atomic_int_fast8_t atomic_int_fast16_t atomic_int_fast32_t atomic_int_fast64_t atomic_uintptr_t atomic_uintmax_t atomic_uint8_t atomic_uint16_t atomic_uint32_t atomic_uint64_t atomic_uint_least8_t atomic_uint_least16_t atomic_uint_least32_t atomic_uint_least64_t atomic_uint_fast8_t atomic_uint_fast16_t atomic_uint_fast32_t atomic_uint_fast64_t atomic_size_t atomic_ptrdiff_t
           bool ptrdiff_t size_t max_align_t wchar_t
           intptr_t intmax_t int8_t int16_t int32_t int64_t int_least8_t int_least16_t int_least32_t int_least64_t int_fast8_t int_fast16_t int_fast32_t int_fast64_t uintptr_t uintmax_t uint8_t uint16_t uint32_t uint64_t uint_least8_t uint_least16_t uint_least32_t uint_least64_t uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
           FILE fpos_t div_t ldiv_t lldiv_t cnd_t thrd_t thrd_start_t tss_t tss_dtor_t mtx_t once_flag
           clock_t time_t timespec tm mbstate_t wint_t wctrans_t wctype_t char16_t char32_t
           ssize_t gid_t uid_t off_t off64_t useconds_t pid_t socklen_t'

    macros='assert static_assert NDEBUG I EDOM EILSEQ ERANGE errno
            FE_DIVBYZERO FE_INEXACT FE_INVALID FE_OVERFLOW FE_UNDERFLOW FE_ALL_EXCEPT FE_DOWNWARD FE_TONEAREST FE_TOWARDZERO FE_UPWARD FE_DFL_ENV
            DECIMAL_DIG FLT_ROUNDS FLT_EVAL_METHOD FLT_RADIX FLT_DIG FLT_MANT_DIG FLT_DECIMAL_DIG FLT_MIN_EXP FLT_MIN_10_EXP FLT_MAX_EXP FLT_MAX FLT_EPSILON FLT_TRUE_MIN FLT_HAS_SUBNORM DBL_DIG DBL_MANT_DIG DBL_DECIMAL_DIG DBL_MIN_EXP DBL_MIN_10_EXP DBL_MAX_EXP DBL_MAX DBL_EPSILON DBL_TRUE_MIN DBL_HAS_SUBNORM LDBL_DIG LDBL_MANT_DIG LDBL_DECIMAL_DIG LDBL_MIN_EXP LDBL_MIN_10_EXP LDBL_MAX_EXP LDBL_MAX LDBL_EPSILON LDBL_TRUE_MIN LDBL_HAS_SUBNORM
            PRIdMAX PRIdPTR PRId8 PRId16 PRId32 PRId64 PRIdLEAST8 PRIdLEAST16 PRIdLEAST32 PRIdLEAST64 PRIdFAST8 PRIdFAST16 PRIdFAST32 PRIdFAST64 PRIiMAX PRIiPTR PRIi8 PRIi16 PRIi32 PRIi64 PRIiLEAST8 PRIiLEAST16 PRIiLEAST32 PRIiLEAST64 PRIiFAST8 PRIiFAST16 PRIiFAST32 PRIiFAST64 PRIoMAX PRIoPTR PRIo8 PRIo16 PRIo32 PRIo64 PRIoLEAST8 PRIoLEAST16 PRIoLEAST32 PRIoLEAST64 PRIoFAST8 PRIoFAST16 PRIoFAST32 PRIoFAST64 PRIuMAX PRIuPTR PRIu8 PRIu16 PRIu32 PRIu64 PRIuLEAST8 PRIuLEAST16 PRIuLEAST32 PRIuLEAST64 PRIuFAST8 PRIuFAST16 PRIuFAST32 PRIuFAST64 PRIxMAX PRIxPTR PRIx8 PRIx16 PRIx32 PRIx64 PRIxLEAST8 PRIxLEAST16 PRIxLEAST32 PRIxLEAST64 PRIxFAST8 PRIxFAST16 PRIxFAST32 PRIxFAST64 PRIXMAX PRIXPTR PRIX8 PRIX16 PRIX32 PRIX64 PRIXLEAST8 PRIXLEAST16 PRIXLEAST32 PRIXLEAST64 PRIXFAST8 PRIXFAST16 PRIXFAST32 PRIXFAST64 SCNdMAX SCNdPTR SCNd8 SCNd16 SCNd32 SCNd64 SCNdLEAST8 SCNdLEAST16 SCNdLEAST32 SCNdLEAST64 SCNdFAST8 SCNdFAST16 SCNdFAST32 SCNdFAST64 SCNiMAX SCNiPTR SCNi8 SCNi16 SCNi32 SCNi64 SCNiLEAST8 SCNiLEAST16 SCNiLEAST32 SCNiLEAST64 SCNiFAST8 SCNiFAST16 SCNiFAST32 SCNiFAST64 SCNoMAX SCNoPTR SCNo8 SCNo16 SCNo32 SCNo64 SCNoLEAST8 SCNoLEAST16 SCNoLEAST32 SCNoLEAST64 SCNoFAST8 SCNoFAST16 SCNoFAST32 SCNoFAST64 SCNuMAX SCNuPTR SCNu8 SCNu16 SCNu32 SCNu64 SCNuLEAST8 SCNuLEAST16 SCNuLEAST32 SCNuLEAST64 SCNuFAST8 SCNuFAST16 SCNuFAST32 SCNuFAST64 SCNxMAX SCNxPTR SCNx8 SCNx16 SCNx32 SCNx64 SCNxLEAST8 SCNxLEAST16 SCNxLEAST32 SCNxLEAST64 SCNxFAST8 SCNxFAST16 SCNxFAST32 SCNxFAST64
            and and_eq bitand bitor compl not not_eq or or_eq xor xor_eq
            CHAR_MIN CHAR_MAX SCHAR_MIN SCHAR_MAX WCHAR_MIN WCHAR_MAX SHRT_MIN SHRT_MAX INT_MIN INT_MAX LONG_MIN LONG_MAX LLONG_MIN LLONG_MAX MB_LEN_MAX UCHAR_MAX USHRT_MAX UINT_MAX ULONG_MAX ULLONG_MAX CHAR_BIT
            LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY LC_NUMERIC LC_TIME
            HUGE_VAL HUGE_VALF HUGE_VALL INFINITY NAN FP_INFINITE FP_NAN FP_NORMAL FP_SUBNORMAL FP_ZERO FP_FAST_FMA FP_FAST_FMAF FP_FAST_FMAL FP_ILOGB0 FP_ILOGBNAN MATH_ERRNO MATH_ERREXCEPT math_errhandling isgreater isgreaterequal isless islessequal islessgreater isunordered
            setjmp
            SIG_DFL SIG_ERR SIG_IGN SIGABRT SIGFPE SIGILL SIGINT SIGSEGV SIGTERM
            va_start va_arg va_end va_copy
            ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE ATOMIC_FLAG_INIT ATOMIC_VAR_INIT memory_order_relaxed memory_order_consume memory_order_acquire memory_order_release memory_order_acq_rel memory_order_seq_cst kill_dependency
            true false NULL
            _IOFBF _IOLBF _IONBF BUFSIZ EOF FOPEN_MAX FILENAME_MAX TMP_MAX L_tmpnam SEEK_CUR SEEK_END SEEK_SET stderr stdin stdout
            EXIT_FAILURE EXIT_SUCCESS MB_CUR_MAX RAND_MAX
            PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX WINT_MIN WINT_MAX INTMAX_MIN INTMAX_MAX INTPTR_MIN INTPTR_MAX INT8_MIN INT8_MAX INT16_MIN INT16_MAX INT32_MIN INT32_MAX INT64_MIN INT64_MAX INT_LEAST8_MIN INT_LEAST8_MAX INT_LEAST16_MIN INT_LEAST16_MAX INT_LEAST32_MIN INT_LEAST32_MAX INT_LEAST64_MIN INT_LEAST64_MAX INT_FAST8_MIN INT_FAST8_MAX INT_FAST16_MIN INT_FAST16_MAX INT_FAST32_MIN INT_FAST32_MAX INT_FAST64_MIN INT_FAST64_MAX UINTMAX_MAX UINTPTR_MAX UINT8_MAX UINT16_MAX UINT32_MAX UINT64_MAX UINT_LEAST8_MAX UINT_LEAST16_MAX UINT_LEAST32_MAX UINT_LEAST64_MAX UINT_FAST8_MAX UINT_FAST16_MAX UINT_FAST32_MAX UINT_FAST64_MAX INTMAX_C INT8_C INT16_C INT32_C INT64_C UINTMAX_C UINT8_C UINT16_C UINT32_C UINT64_C
            mtx_plain mtx_recursive mtx_timed thrd_timedout thrd_success thrd_busy thrd_error thrd_nomem ONCE_FLAG_INIT TSS_DTOR_ITERATION
            CLOCKS_PER_SEC TIME_UTC WEOF noreturn
            R_OK W_OK X_OK F_OK F_LOCK F_ULOCK F_TLOCK F_TEST'

    join() { sep=$2; eval set -- $1; IFS="$sep"; echo "$*"; }

    printf %s\\n "declare-option str-list c_static_words $(join "${keywords} ${attributes} ${types} ${macros}" ' ')"

    printf %s "
        add-highlighter shared/c/code/keywords regex \b($(join "${keywords}" '|'))\b 0:keyword
        add-highlighter shared/c/code/attributes regex \b($(join "${attributes}" '|'))\b 0:attribute
        add-highlighter shared/c/code/types regex \b($(join "${types}" '|'))\b 0:type
        add-highlighter shared/c/code/values regex \b($(join "${macros}" '|'))\b 0:value
    "
}

add-highlighter shared/cpp/raw_string region -match-capture %{R"([^(]*)\(} %{\)([^")]*)"} fill string

add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b[1-9]('?\d+)*(ul?l?|ll?u?)?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0b[01]('?[01]+)*(ul?l?|ll?u?)?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0('?[0-7]+)*(ul?l?|ll?u?)?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0x[\da-f]('?[\da-f]+)*(ul?l?|ll?u?)?\b(?!\.)} 0:value

add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b\d('?\d+)*\.([fl]\b|\B)(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b\d('?\d+)*\.?e[+-]?\d('?\d+)*[fl]?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)(\b(\d('?\d+)*)|\B)\.\d('?[\d]+)*(e[+-]?\d('?\d+)*)?[fl]?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0x[\da-f]('?[\da-f]+)*\.([fl]\b|\B)(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0x[\da-f]('?[\da-f]+)*\.?p[+-]?\d('?\d+)*)?[fl]?\b(?!\.)} 0:value
add-highlighter shared/cpp/code/ regex %{(?i)(?<!\.)\b0x([\da-f]('?[\da-f]+)*)?\.\d('?[\d]+)*(p[+-]?\d('?\d+)*)?[fl]?\b(?!\.)} 0:value

add-highlighter shared/cpp/code/char regex %{(\b(u8|u|U|L)|\B)'((\\.)|[^'\\])'\B} 0:value

evaluate-commands %sh{
    keywords='alignas alignof and and_eq asm bitand bitor break case catch
              compl const_cast continue decltype delete do dynamic_cast
              else export for goto if new not not_eq operator or or_eq
              reinterpret_cast return sizeof static_assert static_cast switch
              throw try typedef typeid using while xor xor_eq'
    attributes='audit auto axiom const consteval constexpr default explicit
                extern final friend inline mutable noexcept override private
                protected public register requires static thread_local typename
                virtual volatile'
    entities='class concept enum namespace struct template union'
    types='bool byte char char8_t char16_t char32_t double float int long
           max_align_t nullptr_t ptrdiff_t short signed size_t unsigned void
           wchar_t'
    values='NULL false nullptr this true'

    join() { sep=$2; eval set -- $1; IFS="$sep"; echo "$*"; }

    printf %s\\n "declare-option str-list cpp_static_words $(join "${keywords} ${attributes} ${entities} ${types} ${values}" ' ')"

    printf %s "
        add-highlighter shared/cpp/code/keywords regex \b($(join "${keywords}" '|'))\b 0:keyword
        add-highlighter shared/cpp/code/attributes regex \b($(join "${attributes} ${entities}" '|'))\b 0:attribute
        add-highlighter shared/cpp/code/types regex \b($(join "${types}" '|'))\b 0:type
        add-highlighter shared/cpp/code/values regex \b($(join "${values}" '|'))\b 0:value
    "
}

evaluate-commands %sh{
    builtin_macros="__cplusplus|__STDC_HOSTED__|__FILE__|__LINE__|__DATE__|__TIME__|__STDCPP_DEFAULT_NEW_ALIGNMENT__"

    printf %s "
        add-highlighter shared/c/code/macros regex \b(${builtin_macros})\b 0:builtin
        add-highlighter shared/cpp/code/macros regex \b(${builtin_macros})\b 0:builtin
    "
}

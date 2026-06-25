add-highlighter shared/gforth regions
add-highlighter shared/gforth/strings region '"' '(?<!\\)(\\\\)*"' fill string
add-highlighter shared/gforth/comments_single region '\\' '$' fill comment
add-highlighter shared/gforth/comments_block region '\(' '\)' fill comment
add-highlighter shared/gforth/code default-region group

add-highlighter shared/gforth/code/operators regex %{(?:^|\s)(\+|-|\*|/|mod|1\+|1-|2\*|2/|and|or|xor|invert|lshift|rshift|dup|drop|swap|over|rot|nip|tuck|2dup|2drop)(?:\s|$)} 1:operator

add-highlighter shared/gforth/code/comparison regex %{(?:^|\s)(<|>|=|<=|>=|<>|0<|0=|0>)(?:\s|$)} 1:operator

add-highlighter shared/gforth/code/keywords regex %{(?:^|\s)(:|;|if|else|then|begin|until|while|repeat|do|loop|\+loop|leave|case|endcase|of|endof|postpone|does>|immediate|compile-only)(?:\s|$)} 1:keyword

add-highlighter shared/gforth/code/builtins regex %{(?:^|\s)(variable|constant|create|value|to|allot|cells|chars|,|c,|@|!|c@|c!|\?|buffer:)(?:\s|$)} 1:builtin

add-highlighter shared/gforth/code/io regex %{(?:^|\s)(\.|cr|emit|space|spaces|type|key|words|page|\.")(?:\s|$)} 1:meta

add-highlighter shared/gforth/code/values_words regex %{(?:^|\s)(true|false|bl)(?:\s|$)} 1:value
add-highlighter shared/gforth/code/values_numbers regex %{(?:^|\s)(-?\d+(?:\.\d+)?)(?:\s|$)} 1:value

declare-option str-list gforth_static_words \
    if else then begin until while repeat do loop +loop leave case endcase of endof \
    variable constant create value to allot cells chars dup drop swap over rot nip tuck \
    and or xor invert cr emit space spaces type key words page true false bl

hook global BufCreate .*\.(fs|fth|4th) %{
    set-option buffer filetype gforth
}

hook global WinSetOption filetype=gforth %{
    add-highlighter window/gforth ref gforth
    add-highlighter window/gforth-matching show-matching
    set-option window static_words %opt{gforth_static_words}
    
    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter window/gforth
        remove-highlighter window/gforth-matching
    }
}

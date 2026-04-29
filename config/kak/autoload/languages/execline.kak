add-highlighter shared/execline regions
add-highlighter shared/execline/strings region '"' '(?<!\\)(\\\\)*"' fill string
add-highlighter shared/execline/comments region '#' '$' fill comment
add-highlighter shared/execline/code default-region group
add-highlighter shared/execline/code/meta regex ^#!.*$ 0:meta
add-highlighter shared/execline/code/operators regex '[\{\};]' 0:operator
add-highlighter shared/execline/code/builtins regex %{\b(backtick|case|define|dieshdiedie|dollarat|el_pushenv|el_semicolon|el_substitute|el_transform|elgetopt|elgetpositionals|elglob|eltest|emptyenv|envfile|exec|execline-cd|execline-shell|execline-startup|execline-umask|execlineb|exit|export-array|export|fdblock|fdclose|fdmove|fdreserve|fdswap|forbacktickx|foreground|forstdin|forx|getcwd|getpid|heredoc|homeof|if|ifelse|ifte|ifthenelse|importas|loopwhilex|multidefine|multisubstitute|pipeline|piperw|posix-cd|posix-umask|redirfd|runblock|shift|trap|tryexec|unexport|wait|withstdinas)\b} 0:builtin
add-highlighter shared/execline/code/flags regex \B--?[a-zA-Z0-9_-]+\b 0:attribute
add-highlighter shared/execline/code/variables regex %{\$(([a-zA-Z_]\w*)|(\{[a-zA-Z_]\w*\})|[#@\d])} 0:variable

hook global BufCreate .*\.(execline|do) %{
    set-option buffer filetype execline
}

hook global WinSetOption filetype=execline %{
    add-highlighter window/execline ref execline
}

hook global BufCreate .* %{
    evaluate-commands %sh{
        head -n 1 "$kak_buffile" | grep -q 'execlineb' && echo "set-option buffer filetype execline" || true
    }
}

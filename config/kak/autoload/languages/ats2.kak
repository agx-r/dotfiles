add-highlighter shared/ats2 regions

add-highlighter shared/ats2/strings region '"' '"' fill string
add-highlighter shared/ats2/chars region "'" "(?<!\\)'" fill string
add-highlighter shared/ats2/comments_single region '//' '$' fill comment
add-highlighter shared/ats2/comments_block region '\(\*' '\*\)' fill comment

add-highlighter shared/ats2/code default-region group

add-highlighter shared/ats2/code/keywords regex \b(if|then|where|else|let|local|in|end|case|case\+|of|and|overload|with|extern|staload|dynload)\b 0:keyword
add-highlighter shared/ats2/code/types regex \b(fun|fn|val|implement|typedef|dataprop|prop|datatype|abstype|absview|viewprop|absvtype|sortdef|datasort|stadef|vtype|view)\b 0:type
add-highlighter shared/ats2/code/values regex \b(true|false|void|int|double|bool|ptr|intptr|nat|char|_)\b 0:value
add-highlighter shared/ats2/code/constructors regex \b([A-Z]\w*)\b 0:variable
add-highlighter shared/ats2/code/numbers regex \b\d+\b 0:value
add-highlighter shared/ats2/code/meta regex ^\s*#\w+\b 0:meta
add-highlighter shared/ats2/code/operators regex (\||~|\+|-|<|<=|&&|\|\||=|\*|=>|->|:|!|\$|\[|\]) 0:operator

hook global BufCreate .*\.(s|d|h)ats %{
    set-option buffer filetype ats2
}

hook global WinSetOption filetype=ats2 %{
    add-highlighter window/ats2 ref ats2
}

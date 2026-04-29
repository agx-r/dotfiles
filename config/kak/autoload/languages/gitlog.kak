add-highlighter shared/gitlog group
add-highlighter shared/gitlog/ regex "(?S)^(commit)\h+([0-9a-f]{7,40})(?:\h+\(([^)\n]+)\))?" 1:keyword 2:string 3:module
add-highlighter shared/gitlog/ regex "(?S)^(Author:)\h+([^<\n]+?)\h+(<[^>\n]+>)" 1:keyword 2:variable 3:type
add-highlighter shared/gitlog/ regex "(?S)^(Date:)\h+(.+)" 1:keyword 2:value
add-highlighter shared/gitlog/ regex "(?S)^\h{4}([a-zA-Z0-9_-]+(?:(?:\[[^\]]+\]|\([^)]+\))|!|):)" 1:attribute
add-highlighter shared/gitlog/ regex "(#[0-9]+)" 0:meta
add-highlighter shared/gitlog/ regex "(?S)`[^`\n]+`" 0:string
add-highlighter shared/gitlog/ regex "(?S)^\h{4}(Co-authored-by:|Signed-off-by:)\h+([^<\n]+?)\h+(<[^>\n]+>)" 1:keyword 2:variable 3:type

hook global WinSetOption filetype=git-log %{
	add-highlighter window/gitlog ref gitlog
}

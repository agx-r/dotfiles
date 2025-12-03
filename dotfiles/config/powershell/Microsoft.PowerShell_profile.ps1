Set-Alias ll "Get-ChildItem"
Set-Alias la "Get-ChildItem -Force"
Set-Alias l "eza"
Set-Alias n "cd ~/.config/home-manager"
Set-Alias h "hx"
Set-Alias b "cd .."

Set-Alias g "git"
Set-Alias gs "git status"
Set-Alias gc "git commit"
Set-Alias ga "git add"

function Prompt {
    $path = (Get-Location).Path
    return "PS ($path) .> "
}

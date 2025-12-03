Set-Alias ll "Get-ChildItem"
Set-Alias la "Get-ChildItem -Force"
Set-Alias l "eza"
Set-Alias n "cd ~/.config/home-manager"
Set-Alias h "hx"
Set-Alias b "cd .."
Set-Alias x "nix"
Set-Alias xs "home-manager switch"
Set-Alias xb "nix build"
Set-Alias xv "nixVulkanIntel"
Set-Alias xg "nixGLIntel"

Set-Alias g "git"
Set-Alias ga "git add"
Set-Alias gs "git status"

function Prompt {
    $path = (Get-Location).Path
    return "PS ($path) .> "
}

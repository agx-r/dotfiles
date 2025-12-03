$env:EDITOR = "hx"
$env:PAGER = "less"

Set-Alias c "cd"
Set-Alias ll "Get-ChildItem"
Set-Alias l "eza"
Set-Alias h "hx"
Set-Alias x "nix"
Set-Alias xv "nixVulkanIntel"
Set-Alias xg "nixGLIntel"
Set-Alias g "git"
Set-Alias ping "Test-Connection"
Set-Alias sel "Select-String"
Set-Alias ps "Get-Process"

function n {
    cd ~/.config/home-manager
}

function xs {
    home-manager switch
}

function gs {
    git status
}

function ga {
    git add @args
}

function xb {
    nix build
}

function b {
    Set-Location ..
}

Set-PSReadLineOption -Colors @{
    "String" = "#ced1f8"
    "Comment" = "#464754"
    "Operator" = "#f6bdd1"
}

function Prompt {
    $path = (Get-Location).Path
    return "PS ($path) .> "
}


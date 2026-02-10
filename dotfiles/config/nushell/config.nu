export-env {
  if ("once" not-in $env) {
    load-env {
      PATH: (
        $env.PATH
        | split row (char esep)
        | prepend ($env.HOME | path join "go" "bin")
        | prepend ($env.HOME | path join ".bin")
        | prepend ($env.HOME | path join ".nix-profile" "bin")
        | prepend ($env.HOME | path join ".local" "bin")
        | prepend ($env.HOME | path join ".cargo" "bin")
      )
      EDITOR: "hx"
      PAGER: "less"
    }
  }
}

let fish_completer = {|spans|
  fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
  | from tsv --flexible --noheaders --no-infer
  | rename value description
  | update value {|row|
    let value = $row.value
    let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
    if ($need_quote and ($value | path exists)) {
      let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
      $'"($expanded_path | str replace --all "\"" "\\\"")"'
    } else {$value}
  }
}

$env.config = {
  show_banner: false
  buffer_editor: "hx"
  completions: {
    external: {
      enable: true
      completer: $fish_completer
    }
  }
}

export def h [
  path?: string
] {
  if ($path | is-empty) {
    hx .
  } else {
    hx $path
  }
}

alias c = cd
alias b = cd ..
alias cx = cd ~/.config/home-manager/
alias l = ls
alias x = nix
alias g = git
alias j = julia
alias ec = emacsclient

alias ll = ls -la
alias ch = cppcheck
alias xb = nix build
alias xv = nixVulkanIntel
alias xg = nixGLIntel
alias xs = home-manager switch

alias ga = git add
alias gs = git status
alias gp = git push

alias gcm = git commit -m
alias gch = git checkout
alias gcl = git clone

if ($env.once? | is-empty) {
  $env.once = "true"
}

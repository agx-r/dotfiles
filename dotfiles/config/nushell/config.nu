$env.config.show_banner = false

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
      )
      EDITOR: "hx"
    }
  }
}

alias c = cd
alias l = ls
alias ll = ls -la
alias b = cd ..

$env.config.buffer_editor = "hx"

$env.pager = "less"

if ($env.once? | is-empty) {
  $env.once = "true"
}

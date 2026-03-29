$env.config.table.mode = "psql"
$env.PATH = "/usr/bin:/bin:/sbin:/usr/sbin"
$env.XDG_RUNTIME_DIR = "/run/user/1000"

let fish_completer = {|spans|
  fish --no-config --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
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

export-env { $env.STARSHIP_SHELL = "nu"; load-env {
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (
        ^/usr/bin/starship prompt --continuation
    )

    PROMPT_INDICATOR: ""

    PROMPT_COMMAND: {||
        (
            let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
            ^/usr/bin/starship prompt
                --cmd-duration $cmd_duration
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
                ...(
                    if (which "job list" | where type == built-in | is-not-empty) {
                        ["--jobs", (job list | length)]
                    } else {
                        []
                    }
                )
        )
    }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
    })

    PROMPT_COMMAND_RIGHT: {||
        (
            let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
            ^/usr/bin/starship prompt
                --right
                --cmd-duration $cmd_duration
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
                ...(
                    if (which "job list" | where type == built-in | is-not-empty) {
                        ["--jobs", (job list | length)]
                    } else {
                        []
                    }
                )
        )
    }
}}

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

alias ip = ip --color=auto

alias c = cd
alias b = cd ..
alias cx = cd ~/stow/config/
alias l = ls
alias g = git

alias ll = ls -la
alias ch = cppcheck

alias ga = git add
alias gs = git status
alias gp = git push

alias gcm = git commit -m
alias gch = git checkout
alias gcl = git clone

if ($env.once? | is-empty) {
  $env.once = "true"
}

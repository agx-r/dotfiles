$env.config.table.mode = "psql"
$env.PATH = "/usr/bin:/bin:/sbin:/usr/sbin"
# $env.XDG_RUNTIME_DIR = "/run/user/1000"

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

def lswt [] {
  ^lswt --json
  | from json
  | get toplevels
  | reject identifier
}

def apk-info [query: string] {
  apk info --format=json $query
  | from json
  | update installed-size { into filesize }
}

def h [path: string = "."] { hx $path }

def l [path: string = "."] { ls $path | sort-by type }
def ll [path: string = "."] { ls -la $path | sort-by type }

def ip [query: string = "a"] {
  ^ip --json $query
  | from json
  | reject ifindex txqlen group qdisc
}

alias fr = flatpak --user run

alias c = cd
alias b = cd ..
alias bb = cd ../..
alias cx = cd ~/stow/config/
alias g = git

alias ch = cppcheck

alias ga = git add
alias gs = git status
alias gp = git push
alias gc = git clone

alias gcm = git commit -m
alias gch = git checkout

if ($env.once? | is-empty) {
  $env.once = "true"
}

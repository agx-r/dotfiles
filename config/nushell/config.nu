use modules/sway_utils.nu swaymsg
use modules/prompt.nu
use modules/gmmode.nu gamemode
use modules/uplbin.nu upl

$env.config.table.mode = "psql"
$env.PATH = "/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/bin:~/.local/bin:~/scripts/path"
$env.GIT_PAGER = "kak -e 'set-option buffer filetype git-log'"

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
}

def apk-query [query: string] {
	apk query --format=json $query
	| from json
	| update file-size { into filesize }
}

def h [path: string = "."] { hx $path }

def ip [...args] {
	^ip --json ...$args
	| from json
	| reject ifindex txqlen group qdisc
}

def lsblk --wrapped [...args] {
	^lsblk --json ...$args
	| from json
}

def lsmod [] {
	^lsmod
	| lines
	| skip 1
	| parse -r '^(?P<name>\S+)\s+(?P<size>\d+)\s+(?P<used_by>\d+)?\s*(?P<dependencies>.*)$'
	| upsert size { |it| $it.size | into filesize }
	| upsert used_by { |it| $it.used_by | into int }
	| upsert dependencies { |row| 
		$row.dependencies
		| split row ","
	}
}

alias fr = flatpak --user run

alias l = ls
alias ll = ls -l
alias k = kak
alias c = cd
alias b = cd ..
alias bb = cd ../..
alias cx = cd ~/stow/config/
alias g = git

alias ch = cppcheck

alias ga = git add
alias gl = git log --no-color
alias gs = git status
alias gp = git push
alias gc = git clone

alias gcm = git commit -m
alias gch = git checkout

if ($env.once? | is-empty) {
	$env.once = "true"
}

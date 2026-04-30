def "get gamemodes" [] {
	[ creative, survival, adventure, spectator ]
}

export def gamemode [
	mode: string@"get gamemodes"
] {
	match $mode {
		"creative" => {
			let init_cmd = '$env.GAMEMODE = "creative"; print "Set own game mode to Creative"'
			^su -p -c $"nu --config ($nu.config-path) -c '($init_cmd); nu'"
		}
		"survival" => {
			if ($env.GAMEMODE? | is-not-empty) and $env.GAMEMODE != "survival" {
				print "Set own game mode to Survival"
				exit
			} else {
				$env.GAMEMODE = "survival"
				print "Set own game mode to Survival"
			}
		}
		"adventure" => {
			let args = [
				--ro-bind /usr /usr --ro-bind /bin /bin --ro-bind /lib /lib --ro-bind /etc /etc
				--dev /dev --proc /proc --tmpfs /tmp
				--ro-bind $env.HOME $env.HOME --bind $env.PWD $env.PWD
				--unshare-all --share-net --die-with-parent
				--setenv GAMEMODE "adventure"
				nu -e 'print "Set own game mode to Adventure"'
			]
			^bwrap ...$args
		}
		"spectator" => {
			let args = [
				--ro-bind /usr /usr --ro-bind /bin /bin --ro-bind /lib /lib --ro-bind /etc /etc
				--ro-bind $env.PWD $env.PWD --dev /dev --proc /proc --tmpfs /tmp
				--ro-bind $env.XDG_CONFIG_HOME $env.XDG_CONFIG_HOME --unshare-all --die-with-parent
				--setenv GAMEMODE "spectator"
				nu -e 'print "Set own game mode to Spectator"'
			]
			^bwrap ...$args
		}
		_ => { error make {msg: "Unknown game mode"}}
	}
}

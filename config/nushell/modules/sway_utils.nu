def "get sway_types" [] { [
	"get_workspaces", "get_inputs", "get_outputs", "get_tree", 
	"get_seats", "get_marks", "get_bar_config", "get_version", 
	"get_binding_modes", "get_binding_state", "get_config", 
	"send_tick", "subscribe", "command"
] }

export def swaymsg [
	message?: string
	--monitor (-m)
	--quiet (-q)
	--socket (-s): string
	--type (-t): string@"get sway_types"
	--version (-v)
] {
	let flags = [
		"-r"
		(if $monitor { "-m" })
		(if $quiet { "-q" })
		(if $socket != null { ["-s" $socket] })
		(if $type != null { ["-t" $type] })
	] | flatten | compact

	let res = if ($message != null) {
		^swaymsg ...$flags $message
	} else {
		^swaymsg ...$flags
	}

	if $quiet or $version {
		$res
	} else {
		$res | from json
	}
}

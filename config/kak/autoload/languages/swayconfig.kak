hook global BufCreate .*(/?sway/config|/?sway/.*\.conf) %{
	set-option buffer filetype sway
}

hook global WinSetOption filetype=sway %{
	require-module sway
	add-highlighter window/sway ref sway
	hook -once -always window WinSetOption filetype=.* %{
		remove-highlighter window/sway
	}
}

provide-module sway %{
	add-highlighter shared/sway regions
	add-highlighter shared/sway/comment region '#' '$' fill comment
	add-highlighter shared/sway/string_double region '"' '"' fill string
	add-highlighter shared/sway/string_single region "'" "'" fill string
	add-highlighter shared/sway/code default-region group
	add-highlighter shared/sway/code/variable regex '\B\$[a-zA-Z0-9_-]+' 0:variable
	add-highlighter shared/sway/code/criteria regex '\[[^\]]+\]' 0:attribute
	add-highlighter shared/sway/code/keyword regex '\b(?:bar|default_orientation|include|swaybg_command|swaynag_command|workspace_layout|xwayland|border|exit|floating|focus|fullscreen|gaps|inhibit_idle|layout|max_render_time|allow_tearing|move|nop|reload|rename|resize|scratchpad|shortcuts_inhibitor|split|splith|splitv|splitt|sticky|swap|title_format|assign|bindsym|bindcode|bindswitch|bindgesture|client\.[a-z_]+|default_border|default_floating_border|exec|exec_always|floating_maximum_size|floating_minimum_size|floating_modifier|focus_follows_mouse|focus_on_window_activation|focus_wrapping|font|force_display_urgency_hint|titlebar_border_thickness|titlebar_padding|for_window|hide_edge_borders|input|seat|kill|smart_borders|smart_gaps|mark|mode|mouse_warping|no_focus|output|popup_during_fullscreen|primary_selection|set|show_marks|opacity|tiling_drag|tiling_drag_threshold|title_align|unbindswitch|unbindgesture|unbindsym|unbindcode|unmark|urgent|workspace|workspace_auto_back_and_forth)\b' 0:keyword
	add-highlighter shared/sway/code/value regex '\b(?:yes|no|always|true|false|enable|disable|toggle|normal|none|pixel|csd|stacking|tabbed|splith|splitv|smart|ignore|leave_fullscreen|on|off)\b' 0:value
}

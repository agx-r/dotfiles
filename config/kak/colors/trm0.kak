evaluate-commands %sh{
	m0="rgb:000000"
	m1="rgb:222222"
	m2="rgb:444444"
	m3="rgb:666666"
	m4="rgb:888888"
	m5="rgb:aaaaaa"
	m6="rgb:cccccc"
	m7="rgb:ffffff"
	red="rgb:ff0000"
	yellow="rgb:ffff00"
	green="rgb:00ff41"
	magenta="rgb:ff00ff"
	cyan="rgb:00ffff"
	darkcyan="rgb:00aaaa"
	darkmagenta="rgb:aa00aa"
	darkgreen="rgb:00ff00"
	darkred="rgb:aa0000"
	darkyellow="rgb:aaaa00"
	darkblue="rgb:0000aa"

	echo "
		face global value ${darkyellow},${m0}
		face global type ${magenta},${m0}
		face global variable ${darkmagenta},${m0}
		face global module ${cyan},${m0}
		face global function ${darkred},${m0}+b
		face global string ${m5},${m0}
		face global keyword ${yellow},${m0}+b
		face global operator ${red},${m0}
		face global attribute ${magenta},${m0}+b
		face global comment ${m3},${m0}
		face global documentation ${m4},${m0}
		face global meta ${magenta},${m0}+b
		face global builtin ${darkcyan},${m0}+b

		face global title ${m7},${m0}+b
		face global header ${m2},${m0}+b
		face global mono ${m4},${m0}
		face global block ${m6},${m0}
		face global link ${m3},${m0}+u
		face global bullet ${m4},${m0}
		face global list ${m5},${m0}

		face global Default ${m6},${m0}

		face global PrimarySelection ${m7},${darkblue}
		face global SecondarySelection ${m0},${m3}

		face global PrimaryCursor ${m0},${m7}+fg
		face global SecondaryCursor ${m0},${m4}+fg
		face global PrimaryCursorEol ${m0},${m5}+fg
		face global SecondaryCursorEol ${m0},${m2}+fg

		face global LineNumbers ${m3},${m0}
		face global LineNumberCursor ${m7},${m0}+b
		face global MenuForeground ${m1},${m6}+b
		face global MenuBackground ${m6},${m0}
		face global MenuInfo ${m6},${m0}
		face global Information ${m7},${m0}
		face global Error ${m7},${darkred}+b
		face global DiagnosticError ${darkred},${m0}
		face global DiagnosticWarning ${darkyellow},${m0}

		face global StatusLine ${m6},${m0}
		face global StatusLineMode ${m0},${cyan}+b
		face global StatusLineInfo ${m6},${m1}
		face global StatusLineValue ${m6},${m1}
		face global StatusCursor ${m0},${m7}
		face global Prompt ${m7},${m3}+b

		face global BufferPadding ${m3},${m0}+b
		face global Whitespace ${darkred},${m0}+f
		face global MatchingChar ${m0},${m4}+b
	"
}

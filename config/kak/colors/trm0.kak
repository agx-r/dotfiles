evaluate-commands %sh{
	m0="rgb:000000"
	m1="rgb:222222"
	m2="rgb:444444"
	m3="rgb:666666"
	m4="rgb:888888"
	m5="rgb:aaaaaa"
	m6="rgb:cccccc"
	m7="rgb:ffffff"

	echo "
		face global value yellow
		face global type bright-yellow
		face global variable magenta
		face global module bright-cyan
		face global function green
		face global string bright-green
		face global keyword bright-magenta
		face global operator bright-yellow
		face global attribute bright-red
		face global comment ${m2}
		face global documentation comment
		face global meta bright-blue
		face global builtin cyan

		face global title ${m7},${m0}+b
		face global header ${m2},${m0}+b
		face global mono ${m4},${m0}
		face global block ${m6},${m0}
		face global link ${m2},${m0}+u
		face global bullet ${m4},${m0}
		face global list ${m5},${m0}

		face global Default ${m6},${m0}

		face global PrimarySelection ${m7},blue
		face global SecondarySelection ${m0},${m3}

		face global PrimaryCursor ${m0},${m7}+fg
		face global SecondaryCursor ${m0},${m4}+fg
		face global PrimaryCursorEol ${m0},${m5}+fg
		face global SecondaryCursorEol ${m0},${m2}+fg

		face global LineNumbers ${m2},${m0}
		face global LineNumberCursor ${m7},${m0}+b
		face global MenuForeground ${m2},${m6}+b
		face global MenuBackground ${m6},${m0}
		face global MenuInfo ${m6},${m0}
		face global Information ${m7},${m0}
		face global Error ${m7},bright-red+b
		face global DiagnosticError bright-red,${m0}
		face global DiagnosticWarning bright-yellow,${m0}

		face global StatusLine ${m6},${m0}
		face global StatusLineMode ${m0},${cyan}+b
		face global StatusLineInfo ${m6},${m2}
		face global StatusLineValue ${m6},${m2}
		face global StatusCursor ${m0},${m7}
		face global Prompt ${m7},${m3}+b

		face global BufferPadding ${m2},${m0}+b
		face global Whitespace red,${m0}+f
		face global MatchingChar ${m0},${m4}+b
	"
}

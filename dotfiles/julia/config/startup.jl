try
    using OhMyREPL
    using Crayons
    import OhMyREPL: Passes.SyntaxHighlighter

    scheme_name = "synthetic"

    function _create_terminal_colorscheme()
        scheme = SyntaxHighlighter.ColorScheme()

        SyntaxHighlighter.symbol!(scheme, Crayon(foreground=0xa7a8de))       # symbol
        SyntaxHighlighter.comment!(scheme, Crayon(foreground=0x252525, italics=true))  # comment
        SyntaxHighlighter.string!(scheme, Crayon(foreground=0xffd6ee))       # string
        SyntaxHighlighter.call!(scheme, Crayon(foreground=0xced1f8))         # call
        SyntaxHighlighter.op!(scheme, Crayon(foreground=0xfff0f1))           # operator
        SyntaxHighlighter.keyword!(scheme, Crayon(foreground=0xffa5d6, bold=true)) # keyword
        SyntaxHighlighter.macro!(scheme, Crayon(foreground=0xced1f8))        # macro
        SyntaxHighlighter.function_def!(scheme, Crayon(foreground=0xced1f8, bold=true)) # function_def
        SyntaxHighlighter.text!(scheme, Crayon(foreground=0xe2e2e2))         # text
        SyntaxHighlighter.error!(scheme, Crayon(foreground=0x5a5a5a, bold=true)) # error
        SyntaxHighlighter.argdef!(scheme, Crayon(foreground=0xecd2e0))       # argdef
        SyntaxHighlighter.number!(scheme, Crayon(foreground=0xffa5d6, bold=true)) # number

        return scheme
    end

    SyntaxHighlighter.add!(scheme_name, _create_terminal_colorscheme())

    OhMyREPL.colorscheme!(scheme_name)

    # @info "$scheme_name colorscheme loaded successfully."

catch e
    @warn "Failed to configure OhMyREPL colorscheme: $e"
end

function fastfetch()
    run(`fastfetch`)
end

quickcasts = Dict(
    "ff" => fastfetch
)

struct QET
    name::String
end

Base.show(io::IO, q::QET) = try
    quickcasts[q.name]()
catch
    nothing
end

for (n, _) in quickcasts
    Base.eval(Main, :( $(Symbol(n)) = QET($n) ))
end

atreplinit() do repl
    try
        mode = repl.interface.modes[1]
        orig = mode.on_enter
        mode.on_enter = line -> begin
            s = strip(line)
            if haskey(quickcasts, s)
                quickcasts[s]()
                true
            elseif orig !== nothing
                orig(line)
            else
                false
            end
        end
    catch
        nothing
    end
end

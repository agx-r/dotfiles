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

function hex_to_vec4(hex::String)
   hex = replace(hex, "#" => "")
   
   if length(hex) == 6
       r, g, b = hex[1:2], hex[3:4], hex[5:6]
       a = "FF"
   elseif length(hex) == 8
       r, g, b, a = hex[1:2], hex[3:4], hex[5:6], hex[7:8]
   else
       error("HEX должен быть 6 или 8 символов")
   end
   
   r = parse(Int, r; base=16)/255.0
   g = parse(Int, g; base=16)/255.0
   b = parse(Int, b; base=16)/255.0
   a = parse(Int, a; base=16)/255.0
   
   return (r, g, b, a)
end

def setup(c):
    palette = {
        "black":      "#000000",
        "base":       "#101010",
        "bright":     "#1b1b1b",
        "text":       "#e7e7e7",
        "subtext":    "#c7c7c7",
        "mute":       "#464754",

        "yellow":     "#aaaa00",
        "cyan":       "#33aaff",
        "light-cyan": "#33ffff",
        "blue":       "#3333ff",
        "green":      "#00ff00",
        "red":        "#ff3333",
        "dark-blue":  "#3333aa",
    }
    
    c.colors.completion.category.bg = palette["black"]
    c.colors.completion.category.border.bottom = palette["black"]
    c.colors.completion.category.border.top = palette["mute"]
    c.colors.completion.category.fg = palette["text"]
    c.colors.completion.even.bg = palette["black"]
    c.colors.completion.odd.bg = palette["black"]
    c.colors.completion.fg = palette["subtext"]

    c.colors.completion.item.selected.bg = palette["base"]
    c.colors.completion.item.selected.border.bottom = palette["base"]
    c.colors.completion.item.selected.border.top = palette["base"]
    c.colors.completion.item.selected.fg = palette["text"]
    c.colors.completion.item.selected.match.fg = palette["green"]
    c.colors.completion.match.fg = palette["green"]

    c.colors.completion.scrollbar.bg = palette["black"]
    c.colors.completion.scrollbar.fg = palette["text"]

    c.colors.downloads.bar.bg = palette["black"]
    c.colors.downloads.error.bg = palette["black"]
    c.colors.downloads.start.bg = palette["black"]
    c.colors.downloads.stop.bg = palette["black"]

    c.colors.downloads.error.fg = palette["red"]
    c.colors.downloads.start.fg = palette["green"]
    c.colors.downloads.stop.fg = palette["yellow"]
    c.colors.downloads.system.fg = "none"
    c.colors.downloads.system.bg = "none"

    c.colors.hints.bg = palette["text"]
    c.colors.hints.fg = palette["black"]

    c.hints.border = "1px solid " + palette["black"]
    c.colors.hints.match.fg = palette["base"]

    c.colors.keyhint.bg = palette["black"]
    c.colors.keyhint.fg = palette["text"]
    c.colors.keyhint.suffix.fg = palette["subtext"]

    c.colors.messages.error.bg = palette["black"]
    c.colors.messages.info.bg = palette["black"]
    c.colors.messages.warning.bg = palette["black"]

    c.colors.messages.error.border = palette["red"]
    c.colors.messages.info.border = palette["subtext"]
    c.colors.messages.warning.border = palette["yellow"]

    c.colors.messages.error.fg = palette["red"]
    c.colors.messages.info.fg = palette["text"]
    c.colors.messages.warning.fg = palette["yellow"]

    c.colors.prompts.bg = palette["black"]

    c.colors.prompts.border = "1px solid " + palette["black"]

    c.colors.prompts.fg = palette["text"]

    c.colors.prompts.selected.bg = palette["base"]

    c.colors.prompts.selected.fg = palette["cyan"]

    c.colors.statusbar.normal.bg = palette["black"]
    c.colors.statusbar.insert.bg = palette["black"]
    c.colors.statusbar.command.bg = palette["black"]
    c.colors.statusbar.caret.bg = palette["black"]
    c.colors.statusbar.caret.selection.bg = palette["base"]

    c.colors.statusbar.progress.bg = palette["black"]
    c.colors.statusbar.passthrough.bg = palette["black"]

    c.colors.statusbar.normal.fg = palette["text"]
    c.colors.statusbar.insert.fg = palette["text"]
    c.colors.statusbar.command.fg = palette["text"]
    c.colors.statusbar.passthrough.fg = palette["text"]
    c.colors.statusbar.caret.fg = palette["text"]
    c.colors.statusbar.caret.selection.fg = palette["text"]

    c.colors.statusbar.url.error.fg = palette["red"]

    c.colors.statusbar.url.fg = palette["text"]

    c.colors.statusbar.url.hover.fg = palette["blue"]

    c.colors.statusbar.url.success.http.fg = palette["green"]

    c.colors.statusbar.url.success.https.fg = palette["blue"]

    c.colors.statusbar.url.warn.fg = palette["yellow"]

    c.colors.statusbar.private.bg = palette["black"]
    c.colors.statusbar.private.fg = palette["subtext"]
    c.colors.statusbar.command.private.bg = palette["black"]
    c.colors.statusbar.command.private.fg = palette["subtext"]


    c.colors.tabs.bar.bg = palette["black"]
    c.colors.tabs.even.bg = palette["base"]
    c.colors.tabs.odd.bg = palette["base"]

    c.colors.tabs.even.fg = palette["text"]
    c.colors.tabs.odd.fg = palette["text"]

    c.colors.tabs.indicator.error = palette["red"]
    c.colors.tabs.indicator.start = palette["green"]
    c.colors.tabs.indicator.stop = palette["blue"]
    c.colors.tabs.indicator.system = "none"

    c.colors.tabs.selected.even.bg = palette["black"]
    c.colors.tabs.selected.odd.bg = palette["black"]

    c.colors.tabs.selected.even.fg = palette["text"]
    c.colors.tabs.selected.odd.fg = palette["text"]

    c.colors.contextmenu.menu.bg = palette["black"]
    c.colors.contextmenu.menu.fg = palette["text"]

    c.colors.contextmenu.disabled.bg = palette["black"]
    c.colors.contextmenu.disabled.fg = palette["base"]

    c.colors.contextmenu.selected.bg = palette["black"]
    c.colors.contextmenu.selected.fg = palette["blue"]

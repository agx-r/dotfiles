def setup(c):
    palette = {
        "black":     "#000000",
        "dark":      "#101010",
        "base":      "#1b1b1b",
        "bright":    "#292929",
        "text":      "#e7e7e7",
        "subtext":   "#c7c7c7",
        "mute":      "#464754",

        "yellow":    "#fff0f1",
        "cyan":      "#ced1f8",
        "pink":      "#ffd6ee",
        "dark-cyan": "#a7a8de",
        "red":       "#ff95b6",
        "dark-pink": "#f3e8e7",
    }
    
    c.colors.completion.category.bg = palette["dark"]
    c.colors.completion.category.border.bottom = palette["dark"]
    c.colors.completion.category.border.top = palette["mute"]
    c.colors.completion.category.fg = palette["yellow"]
    c.colors.completion.even.bg = palette["dark"]
    c.colors.completion.odd.bg = palette["dark"]
    c.colors.completion.fg = palette["subtext"]

    c.colors.completion.item.selected.bg = palette["base"]
    c.colors.completion.item.selected.border.bottom = palette["base"]
    c.colors.completion.item.selected.border.top = palette["base"]
    c.colors.completion.item.selected.fg = palette["text"]
    c.colors.completion.item.selected.match.fg = palette["pink"]
    c.colors.completion.match.fg = palette["pink"]

    c.colors.completion.scrollbar.bg = palette["base"]
    c.colors.completion.scrollbar.fg = palette["text"]

    c.colors.downloads.bar.bg = palette["dark"]
    c.colors.downloads.error.bg = palette["dark"]
    c.colors.downloads.start.bg = palette["dark"]
    c.colors.downloads.stop.bg = palette["dark"]

    c.colors.downloads.error.fg = palette["red"]
    c.colors.downloads.start.fg = palette["dark-cyan"]
    c.colors.downloads.stop.fg = palette["yellow"]
    c.colors.downloads.system.fg = "none"
    c.colors.downloads.system.bg = "none"

    c.colors.hints.bg = palette["pink"]
    c.colors.hints.fg = palette["black"]

    c.hints.border = "1px solid " + palette["black"]
    c.colors.hints.match.fg = palette["base"]

    c.colors.keyhint.bg = palette["black"]
    c.colors.keyhint.fg = palette["text"]
    c.colors.keyhint.suffix.fg = palette["subtext"]

    c.colors.messages.error.bg = palette["dark"]
    c.colors.messages.info.bg = palette["dark"]
    c.colors.messages.warning.bg = palette["dark"]

    c.colors.messages.error.border = palette["red"]
    c.colors.messages.info.border = palette["subtext"]
    c.colors.messages.warning.border = palette["yellow"]

    c.colors.messages.error.fg = palette["red"]
    c.colors.messages.info.fg = palette["text"]
    c.colors.messages.warning.fg = palette["yellow"]

    c.colors.prompts.bg = palette["black"]

    c.colors.prompts.border = "1px solid " + palette["dark"]

    c.colors.prompts.fg = palette["text"]

    c.colors.prompts.selected.bg = palette["base"]

    c.colors.prompts.selected.fg = palette["cyan"]

    c.colors.statusbar.normal.bg = palette["dark"]
    c.colors.statusbar.insert.bg = palette["dark"]
    c.colors.statusbar.command.bg = palette["dark"]
    c.colors.statusbar.caret.bg = palette["dark"]
    c.colors.statusbar.caret.selection.bg = palette["base"]

    c.colors.statusbar.progress.bg = palette["dark"]
    c.colors.statusbar.passthrough.bg = palette["dark"]

    c.colors.statusbar.normal.fg = palette["text"]
    c.colors.statusbar.insert.fg = palette["cyan"]
    c.colors.statusbar.command.fg = palette["pink"]
    c.colors.statusbar.passthrough.fg = palette["red"]
    c.colors.statusbar.caret.fg = palette["yellow"]
    c.colors.statusbar.caret.selection.fg = palette["base"]

    c.colors.statusbar.url.error.fg = palette["red"]

    c.colors.statusbar.url.fg = palette["pink"]

    c.colors.statusbar.url.hover.fg = palette["dark-pink"]

    c.colors.statusbar.url.success.http.fg = palette["red"]

    c.colors.statusbar.url.success.https.fg = palette["pink"]

    c.colors.statusbar.url.warn.fg = palette["yellow"]

    c.colors.statusbar.private.bg = palette["dark"]
    c.colors.statusbar.private.fg = palette["subtext"]
    c.colors.statusbar.command.private.bg = palette["dark"]
    c.colors.statusbar.command.private.fg = palette["subtext"]


    c.colors.tabs.bar.bg = palette["dark"]
    c.colors.tabs.even.bg = palette["base"]
    c.colors.tabs.odd.bg = palette["base"]

    c.colors.tabs.even.fg = palette["text"]
    c.colors.tabs.odd.fg = palette["text"]

    c.colors.tabs.indicator.error = palette["red"]
    c.colors.tabs.indicator.start = palette["dark-pink"]
    c.colors.tabs.indicator.stop = palette["pink"]
    c.colors.tabs.indicator.system = "none"

    c.colors.tabs.selected.even.bg = palette["dark"]
    c.colors.tabs.selected.odd.bg = palette["dark"]

    c.colors.tabs.selected.even.fg = palette["pink"]
    c.colors.tabs.selected.odd.fg = palette["pink"]

    c.colors.contextmenu.menu.bg = palette["dark"]
    c.colors.contextmenu.menu.fg = palette["text"]

    c.colors.contextmenu.disabled.bg = palette["dark"]
    c.colors.contextmenu.disabled.fg = palette["base"]

    c.colors.contextmenu.selected.bg = palette["dark"]
    c.colors.contextmenu.selected.fg = palette["pink"]

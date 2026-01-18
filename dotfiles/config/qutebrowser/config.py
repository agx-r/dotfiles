import os
import palette

DARK_MODE = True 

# SEARCH = "http://localhost:8090/yacysearch.html?query={}"
SEARCH = "http://localhost:8080/search?q={}"

# STARTPAGE = "file://" + os.path.expanduser("~/.config/qutebrowser/start.html")
STARTPAGE = "http://localhost:8080"

DEFAULT_PAGE = STARTPAGE 

DISABLE_JS = False

QUICKMARKS = [
    {
        'key': 'gh',
        'link': 'https://github.com/'
    },
    {
        'key': 'sear',
        'link': 'http://localhost:8080/'
    },
    {
        'key': 'goo',
        'link': 'https://google.com/'
    },
    {
        'key': 'duck',
        'link': 'https://lite.duckduckgo.com/lite'
    },
    {
        'key': 'qut',
        'link': 'https://qutebrowser.org/doc/help'
    },
    {
        'key': 'inv',
        'link': 'https://inv.nadeko.net/feed/popular'
    },
    {
        'key': 'code',
        'link': 'http://localhost:8443/'
    },
    {
        'key': 'cab',
        'link': 'https://www.codeabbey.com/index/task_list'
    },
    {
        'key': 'zig',
        'link': 'https://studygyaan.com/cheatsheet/zig'
    },
    {
        'key': 'nerd',
        'link': 'https://www.nerdfonts.com/cheat-sheet'
    },
    {
        'key': 'nix',
        'link': 'https://searchix.ovh/'
    },
    {
        'key': 'codb',
        'link': 'https://www.codeberg.org'
    }
]

DISABLE_JS_EXCEPTIONS= [
    'devtools://*',
    'chrome-devtools://*',
    'chrome://*/*',
    'qute://*/*',

    'http://127.0.0.1:*/*',
    'https://www.bluetooth.com/specifications/*',
    'https://github.com/*',
    'https://bitbucket.org/*',
    'https://hub.docker.com/*',
]

config.load_autoconfig(False)

# interface
palette.setup(c)
config.set('colors.webpage.darkmode.enabled', DARK_MODE)
config.set('colors.webpage.darkmode.policy.images', 'never')
c.tabs.title.format = "{audio}{id}: {current_title}"

# privacy
config.set('content.proxy', 'socks://127.0.0.1:10808')

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')

config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

if DISABLE_JS:
    config.set('content.javascript.enabled', False)

    for url_to_enable in DISABLE_JS_EXCEPTIONS:
        config.set('content.javascript.enabled', True, url_to_enable)
else:
    config.set("content.private_browsing", False)
    config.set("content.webgl", False, "*")
    config.set("content.canvas_reading", False)
    config.set("content.geolocation", False)
    config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")

config.set('content.local_content_can_access_remote_urls', True, 'file:///home/agx/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/agx/.local/share/qutebrowser/userscripts/*')

# start pages
config.set('url.default_page', DEFAULT_PAGE)
config.set('url.start_pages', STARTPAGE)
config.set('url.searchengines', {'DEFAULT': SEARCH})

# editor
c.editor.command = ['foot', '-a', 'floating', 'hx', '{file}:{line}:{column}']

# colemak
c.hints.chars = 'arstneio'

# NOR
config.unbind('\'', 'normal')
config.unbind('H', 'normal')
config.unbind('L', 'normal')
config.unbind('N', 'normal')
config.unbind('n', 'normal')
config.unbind('h', 'normal')
config.unbind('j', 'normal')
config.unbind('k', 'normal')
config.unbind('l', 'normal')
config.unbind('=', 'normal')
config.unbind('sl', 'normal')
config.unbind('ss', 'normal')
config.unbind('sk', 'normal')
config.unbind('th', 'normal')
config.unbind('th', 'normal')
config.unbind('d', 'normal')
config.unbind('<Ctrl-Q>', 'normal')

config.bind('h', 'scroll left', 'normal')
config.bind('n', 'scroll down', 'normal')
config.bind('e', 'scroll up', 'normal')
config.bind('i', 'scroll right', 'normal')

config.bind('l', "back", 'normal')
config.bind('L', "forward", 'normal')

config.bind('K', 'search-prev', 'normal')
config.bind('k', 'search-next', 'normal')

config.bind('r', 'reload', 'normal')
config.bind('R', 'reload -f', 'normal')

config.bind('tn', 'open -t', 'normal')
config.bind('s', 'close', 'normal')
config.bind('d', 'clear-messages', 'normal')

config.bind('gg', 'scroll-to-perc 0', 'normal')
config.bind('ge', 'scroll-to-perc', 'normal')

config.bind('tu', "back -t", 'normal')
config.bind('tU', "forward -t", 'normal')

config.bind(' e', "edit-url", 'normal')
config.bind(' h', "tab-prev", 'normal')
config.bind(' i', "tab-next", 'normal')
config.bind(' f', 'view-source', 'normal')

config.bind('<Ctrl-L>', 'clear-messages', 'normal')

config.bind('u', 'mode-enter insert', 'normal')

# config.bind('<Ctrl> /', 'undo -w', 'normal')

config.bind('y', 'cmd-set-text -s :open', 'normal')
config.bind('Y', 'cmd-set-text -s :open -t', 'normal')

config.bind(';', 'paste', 'normal')
config.bind(':', 'paste', 'normal')

config.bind('O', 'cmd-set-text :', 'normal')
config.bind('o', 'cmd-set-text :', 'normal')

config.bind('j', 'yank url', 'normal')

config.bind('zz', 'zoom', 'normal')
config.bind('zi', 'zoom-in', 'normal')
config.bind('zo', 'zoom-out', 'normal')

# INS
config.bind('<Alt-F>', 'fake-key <Ctrl-Right>', 'insert')
config.bind('<Alt-B>', 'fake-key <Ctrl-Left>', 'insert')
config.bind('<Alt-D>', 'fake-key <Ctrl-Shift-Right>;;fake-key <Ctrl-X>', 'insert')
config.bind('<Alt-Backspace>', 'fake-key <Ctrl-Backspace>', 'insert')
config.bind('<Ctrl-W>', 'fake-key <Ctrl-Shift-Left>;;fake-key <Ctrl-X>', 'insert')
config.bind('<Ctrl-F>', 'fake-key <Right>', 'insert')
config.bind('<Ctrl-B>', 'fake-key <Left>', 'insert')
config.bind('<Ctrl-D>', 'fake-key <Delete>', 'insert')
config.bind('<Ctrl-N>', 'fake-key <Down>', 'insert')
config.bind('<Ctrl-P>', 'fake-key <Up>', 'insert')
config.bind('<Ctrl-A>', 'fake-key <Home>', 'insert')
config.bind('<Ctrl-E>', 'fake-key <End>', 'insert')
config.bind('<Ctrl-U>', 'fake-key <Shift-Home>;;fake-key <Delete>', 'insert')
config.bind('<Ctrl-/>', 'fake-key <Ctrl-Z>', 'insert')

# CRT
config.bind('h', 'move-to-prev-char', 'caret')
config.bind('n', 'move-to-next-line', 'caret')
config.bind('e', 'move-to-prev-line', 'caret')
config.bind('i', 'move-to-next-char', 'caret')

config.bind('N', 'scroll down', 'caret')
config.bind('E', 'scroll up', 'caret')

config.bind('f', 'move-to-end-of-word', 'caret')

config.bind('j', 'yank selection', 'caret')
config.bind('J', 'yank selection -s', 'caret')

# PST
config.bind('<Escape>', 'leave-mode', 'passthrough')

# QUI
for quickmark in QUICKMARKS:
    config.bind(f"'{quickmark['key']}", f"open {quickmark['link']}", 'normal')
    config.bind(f'"{quickmark["key"]}', f"open --tab {quickmark['link']}", 'normal')

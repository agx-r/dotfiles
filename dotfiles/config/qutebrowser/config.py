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

# Interface
palette.setup(c)
config.set('colors.webpage.darkmode.enabled', DARK_MODE)

# Privacy
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

# Start pages
config.set('url.default_page', DEFAULT_PAGE)
config.set('url.start_pages', STARTPAGE)
config.set('url.searchengines', {'DEFAULT': SEARCH})

# Colemak
c.hints.chars = 'arstneio'

# normal
# movement
config.unbind('\'', 'normal')

config.bind('h', 'scroll left', 'normal')
config.bind('n', 'scroll down', 'normal')
config.bind('e', 'scroll up', 'normal')
config.bind('i', 'scroll right', 'normal')

config.bind('N', "tab-prev", 'normal')
config.bind('E', "tab-next", 'normal')

config.bind('K', 'search-prev', 'normal')
config.bind('k', 'search-next', 'normal')

config.bind('u', 'mode-enter insert', 'normal')

config.bind('l', 'undo -w', 'normal')

config.bind('y', 'cmd-set-text -s :open', 'normal')
config.bind('Y', 'cmd-set-text -s :open -t', 'normal')

config.bind(';', 'paste', 'normal')
config.bind(':', 'paste', 'normal')

config.bind('O', 'cmd-set-text :', 'normal')
config.bind('o', 'cmd-set-text :', 'normal')

config.bind('s', 'close tab', 'normal')
config.bind('r', 'yank url', 'normal')

config.bind('zi', 'zoom-in', 'normal')
config.bind('zo', 'zoom-out', 'normal')

# caret
# movement
config.bind('h', 'move-to-prev-char', 'caret')
config.bind('n', 'move-to-next-line', 'caret')
config.bind('e', 'move-to-prev-line', 'caret')
config.bind('i', 'move-to-next-char', 'caret')

config.bind('N', 'scroll down', 'caret')
config.bind('E', 'scroll up', 'caret')

config.bind('f', 'move-to-end-of-word', 'caret')

config.bind('j', 'yank selection', 'caret')
config.bind('J', 'yank selection -s', 'caret')

# passthrough
config.bind('<Escape>', 'leave-mode', 'passthrough')

# quickmarks
for quickmark in QUICKMARKS:
    config.bind(f"'{quickmark['key']}", f"open {quickmark['link']}", 'normal')
    config.bind(f'"{quickmark["key"]}', f"open --tab {quickmark['link']}", 'normal')

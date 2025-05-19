import os

DARK_MODE = False 

STARTPAGE = "file://" + os.path.expanduser("~/.config/qutebrowser/start.html")

DEFAULT_PAGE = STARTPAGE 

# SEARCH = "http://localhost:8090/yacysearch.html?query={}"
# SEARCH = "http://localhost:8080/search?q={}"
SEARCH = "https://www.google.com/search?q={}"

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
        'link': 'https://www.codeabbey.com/index/task_list'
    },
    {
        'key': 'zig',
        'link': 'https://studygyaan.com/cheatsheet/zig'
    },
    {
        'key': 'cat',
        'link': 'https://catppuccin.com/ports/'
    },
    {
        'key': 'nerd',
        'link': 'https://www.nerdfonts.com/cheat-sheet'
    },
    {
        'key': 'guix',
        'link': 'https://codeberg.org/guix/guix-mirror'
    },
    {
        'key': 'git',
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
import catppuccin
catppuccin.setup(c, 'mocha', True)
config.set('colors.webpage.darkmode.enabled', DARK_MODE)

# Privacy
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

# * Helper Functions
def bind(key, command, mode):  # noqa: E302
    """Bind key to command in mode."""
    # TODO set force; doesn't exist yet
    config.bind(key, command, mode=mode)


def nmap(key, command):
    """Bind key to command in normal mode."""
    bind(key, command, 'normal')


def imap(key, command):
    """Bind key to command in insert mode."""
    bind(key, command, 'insert')


def cmap(key, command):
    """Bind key to command in command mode."""
    bind(key, command, 'command')


def tmap(key, command):
    """Bind key to command in caret mode."""
    bind(key, command, 'caret')


def pmap(key, command):
    """Bind key to command in passthrough mode."""
    bind(key, command, 'passthrough')


def unmap(key, mode):
    """Unbind key in mode."""
    config.unbind(key, mode=mode)


def nunmap(key):
    """Unbind key in normal mode."""
    unmap(key, mode='normal')

# Colemak
c.hints.chars = 'arstneio'

# Normal
# Movement
nmap('h', 'scroll left')
nmap('n', 'scroll down')
nmap('e', 'scroll up')
nmap('i', 'scroll right')

nmap('N', "tab-prev")
nmap('E', "tab-next")

nmap('K', 'search-prev')
nmap('k', 'search-next')

nmap('u', 'mode-enter insert')

nmap('l', 'undo -w')

nmap('y', 'cmd-set-text -s :open')
nmap('Y', 'cmd-set-text -s :open -t')

nmap(';', 'paste')
nmap(':', 'paste')

nmap('O', 'cmd-set-text :')
nmap('o', 'cmd-set-text :')

nmap('s', 'close tab')
nmap('r', 'yank url')

# Caret
# Movement
tmap('h', 'move-to-prev-char')
tmap('n', 'move-to-next-line')
tmap('e', 'move-to-prev-line')
tmap('i', 'move-to-next-char')

tmap('N', 'scroll down')
tmap('E', 'scroll up')

tmap('f', 'move-to-end-of-word')

tmap('j', 'yank selection')
tmap('J', 'yank selection -s')

# Passthrough
pmap('<Escape>', 'leave-mode')

# Quckmarks
nunmap("'")

for quickmark in QUICKMARKS:
    nmap(f"'{quickmark['key']}", f"open {quickmark['link']}")
    nmap(f'"{quickmark["key"]}', f"open --tab {quickmark['link']}")

# Zooming
nmap("zi", "zoom-in")
nmap("zo", "zoom-out")


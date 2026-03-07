# Load existing settings, so we only override what we need to.
config.load_autoconfig()

# Load theme
config.source("theme.py")

# Load settings
config.source("settings.py")

# Other searchable sites
config.set(
    "url.searchengines",
    {
        "DEFAULT": "https://duckduckgo.com/?q={}",
        "!aw": " https://wiki.archlinux.org/index.php?search={}",
        "!apkg": "https://archlinux.org/packages/?sort=&q={}&maintainer=flagged=",
        "!gh": "https://github.com/search?q={}&type=repositories",
        "!yt": "https://www.youtube.com/results?search_query={}",
        "!rit": "https://www.reddit.com/search/?q={}&c",
    },
)

# Load existing settings, so we only override what we need to.
config.load_autoconfig()

# Load theme
config.source("theme.py")

# Load settings
config.source("settings.py")

# Force media-capture permissions for Google Meet login/call flows.
config.set("content.media.audio_capture", True, "https://meet.google.com")
config.set("content.media.audio_video_capture", True, "https://meet.google.com")
config.set("content.media.audio_capture", True, "https://accounts.google.com")
config.set("content.media.audio_video_capture", True, "https://accounts.google.com")

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

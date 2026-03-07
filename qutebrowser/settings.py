# -----------------------------------------------------------------------------
# qutebrowser settings
# -----------------------------------------------------------------------------

# --- UI & Behavior -----------------------------------------------------------
# For a minimal look.
config.set("scrolling.bar", "never")
config.set("tabs.show", "switching")  # Only show tabs when there are more than one
config.set("tabs.position", "top")
config.set("tabs.favicons.show", "never")
config.set("tabs.title.format", "{current_title}")
config.set("tabs.title.format_pinned", "{current_title}")
config.set("statusbar.show", "in-mode")  # Show status bar only in command/insert mode

# Set DuckDuckGo as the default and start page.
config.set("url.default_page", "https://duckduckgo.com")
config.set("url.start_pages", ["https://duckduckgo.com"])
# config.set("url.searchengines", {"DEFAULT": "https://duckduckgo.com/?q={}"})


# Enable smooth scrolling.
config.set("scrolling.smooth", True)

# Set default zoom level.
config.set("zoom.default", "100%")

# Shrink completion widget to fit content.
config.set("completion.shrink", True)

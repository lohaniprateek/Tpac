# -----------------------------------------------------------------------------
# goose | qutebrowser theme configuration
# -----------------------------------------------------------------------------

# --- Theme & Colors ----------------------------------------------------------
# Using a Dracula-inspired color palette.
palette = {
    "background": "#282a36",
    "current-line": "#44475a",
    "foreground": "#f8f8f2",
    "comment": "#6272a4",
    "cyan": "#8be9fd",
    "green": "#50fa7b",
    "orange": "#ffb86c",
    "pink": "#ff79c6",
    "purple": "#bd93f9",
    "red": "#ff5555",
    "yellow": "#f1fa8c",
}

# Enable dark mode for web content.
# This is a feature of Qt WebEngine and may not work on all sites.
config.set("colors.webpage.darkmode.enabled", True)

# Status bar
config.set("colors.statusbar.normal.bg", palette["background"])
config.set("colors.statusbar.normal.fg", palette["foreground"])
config.set("colors.statusbar.command.bg", palette["background"])
config.set("colors.statusbar.command.fg", palette["foreground"])
config.set("colors.statusbar.progress.bg", palette["purple"])
config.set("colors.statusbar.url.success.http.fg", palette["foreground"])
config.set("colors.statusbar.url.success.https.fg", palette["green"])
config.set("colors.statusbar.url.error.fg", palette["red"])
config.set("colors.statusbar.url.warn.fg", palette["yellow"])

# Tabs
config.set("colors.tabs.bar.bg", palette["current-line"])
config.set("colors.tabs.indicator.start", palette["purple"])
config.set("colors.tabs.indicator.stop", palette["orange"])
config.set("colors.tabs.indicator.error", palette["red"])
config.set("colors.tabs.odd.bg", palette["current-line"])
config.set("colors.tabs.odd.fg", palette["foreground"])
config.set("colors.tabs.even.bg", palette["current-line"])
config.set("colors.tabs.even.fg", palette["foreground"])
config.set("colors.tabs.selected.odd.bg", palette["background"])
config.set("colors.tabs.selected.odd.fg", palette["foreground"])
config.set("colors.tabs.selected.even.bg", palette["background"])
config.set("colors.tabs.selected.even.fg", palette["foreground"])

# Completion widget
config.set("colors.completion.fg", palette["foreground"])
config.set("colors.completion.odd.bg", palette["background"])
config.set("colors.completion.even.bg", palette["background"])
config.set("colors.completion.category.fg", palette["purple"])
config.set("colors.completion.category.bg", palette.get("background"))
config.set("colors.completion.item.selected.fg", palette["foreground"])
config.set("colors.completion.item.selected.bg", palette["current-line"])
config.set("colors.completion.item.selected.border.top", palette["current-line"])
config.set("colors.completion.item.selected.border.bottom", palette["current-line"])
config.set("colors.completion.match.fg", palette["orange"])

# Hints (for following links)
config.set("colors.hints.fg", palette["background"])
config.set("colors.hints.bg", palette["purple"])
config.set("colors.hints.match.fg", palette["foreground"])
config.set("hints.border", f"1px solid {palette['background']}")

# Messages
config.set("colors.messages.error.bg", palette["red"])
config.set("colors.messages.error.fg", palette["foreground"])
config.set("colors.messages.warning.bg", palette["yellow"])
config.set("colors.messages.warning.fg", palette["background"])
config.set("colors.messages.info.bg", palette["comment"])
config.set("colors.messages.info.fg", palette["foreground"])

# Downloads
config.set("colors.downloads.bar.bg", palette["background"])
config.set("colors.downloads.start.fg", palette["background"])
config.set("colors.downloads.start.bg", palette["purple"])
config.set("colors.downloads.stop.fg", palette["background"])
config.set("colors.downloads.stop.bg", palette["green"])
config.set("colors.downloads.error.fg", palette["foreground"])
config.set("colors.downloads.error.bg", palette["red"])

# --- Fonts -------------------------------------------------------------------
# Use a clean, modern monospace font.
# You may need to install "Fira Code" or "JetBrains Mono" for the best look.
config.set("fonts.default_family", '"JetBrains Mono", "Fira Code", "monospace"')
config.set("fonts.default_size", "10pt")

# -----------------------------------------------------------------------------
# qutebrowser theme configuration
# -----------------------------------------------------------------------------

# Gruvbox Dark palette (hard contrast variant).
palette = {
    "bg0_h": "#1d2021",
    "bg0": "#282828",
    "bg1": "#3c3836",
    "bg3": "#665c54",
    "fg0": "#fbf1c7",
    "fg1": "#ebdbb2",
    "gray": "#928374",
    "red": "#fb4934",
    "green": "#b8bb26",
    "yellow": "#fabd2f",
    "blue": "#83a598",
    "purple": "#d3869b",
    "aqua": "#8ec07c",
    "orange": "#fe8019",
}

# Ask QtWebEngine to prefer dark rendering for pages.
config.set("colors.webpage.darkmode.enabled", True)

# Status bar colors.
config.set("colors.statusbar.normal.bg", palette["bg0"])
config.set("colors.statusbar.normal.fg", palette["fg1"])
config.set("colors.statusbar.command.bg", palette["bg0"])
config.set("colors.statusbar.command.fg", palette["fg1"])
config.set("colors.statusbar.progress.bg", palette["aqua"])
config.set("colors.statusbar.url.success.http.fg", palette["fg1"])
config.set("colors.statusbar.url.success.https.fg", palette["green"])
config.set("colors.statusbar.url.error.fg", palette["red"])
config.set("colors.statusbar.url.warn.fg", palette["yellow"])

# Tab bar and tab states.
config.set("colors.tabs.bar.bg", palette["bg1"])
config.set("colors.tabs.indicator.start", palette["aqua"])
config.set("colors.tabs.indicator.stop", palette["blue"])
config.set("colors.tabs.indicator.error", palette["red"])
config.set("colors.tabs.odd.bg", palette["bg1"])
config.set("colors.tabs.odd.fg", palette["fg1"])
config.set("colors.tabs.even.bg", palette["bg1"])
config.set("colors.tabs.even.fg", palette["fg1"])
config.set("colors.tabs.selected.odd.bg", palette["bg0_h"])
config.set("colors.tabs.selected.odd.fg", palette["fg0"])
config.set("colors.tabs.selected.even.bg", palette["bg0_h"])
config.set("colors.tabs.selected.even.fg", palette["fg0"])

# Completion dropdown in command mode.
config.set("colors.completion.fg", palette["fg1"])
config.set("colors.completion.odd.bg", palette["bg0"])
config.set("colors.completion.even.bg", palette["bg0"])
config.set("colors.completion.category.fg", palette["yellow"])
config.set("colors.completion.category.bg", palette["bg1"])
config.set("colors.completion.item.selected.fg", palette["fg0"])
config.set("colors.completion.item.selected.bg", palette["bg3"])
config.set("colors.completion.item.selected.border.top", palette["bg3"])
config.set("colors.completion.item.selected.border.bottom", palette["bg3"])
config.set("colors.completion.match.fg", palette["orange"])

# Hint labels when using link hint mode.
config.set("colors.hints.fg", palette["bg0_h"])
config.set("colors.hints.bg", palette["yellow"])
config.set("colors.hints.match.fg", palette["red"])
config.set("hints.border", f"1px solid {palette['bg0_h']}")

# In-app message colors.
config.set("colors.messages.error.bg", palette["red"])
config.set("colors.messages.error.fg", palette["bg0_h"])
config.set("colors.messages.warning.bg", palette["yellow"])
config.set("colors.messages.warning.fg", palette["bg0_h"])
config.set("colors.messages.info.bg", palette["blue"])
config.set("colors.messages.info.fg", palette["bg0_h"])

# Download bar colors.
config.set("colors.downloads.bar.bg", palette["bg0"])
config.set("colors.downloads.start.fg", palette["bg0_h"])
config.set("colors.downloads.start.bg", palette["blue"])
config.set("colors.downloads.stop.fg", palette["bg0_h"])
config.set("colors.downloads.stop.bg", palette["green"])
config.set("colors.downloads.error.fg", palette["bg0_h"])
config.set("colors.downloads.error.bg", palette["red"])

# Optional defaults that fit the theme.
config.set("fonts.default_family", '"JetBrains Mono", "Fira Code", "monospace"')
config.set("fonts.default_size", "10pt")

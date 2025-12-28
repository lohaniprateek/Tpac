# Load existing settings, so we only override what we need to.
config.load_autoconfig()

# Load theme
config.source('theme.py')

# Load settings
config.source('settings.py')

# Load keybindings
config.source('keys.py')

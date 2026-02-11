!#/bin/zsh
grim -g "$(slurp)" - | swappy -f - -o "~/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png"

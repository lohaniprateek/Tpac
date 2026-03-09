#!/bin/bash

earphones() {

  notify-send "Audio switched to Earphones!"
}

airdopes() {

  notify-send "Audio switched to Airdopes!"
}

speaker() {

  notify-send "Audio switched to Speakers!"
}

Headphone() {

  notify-send "Audio switched to headphones!"
}

audioout() {
  choice=$(printf "Earphones\\nAirdopes\\nSpeakers\\nHeadphones\\" | dmenu -l 4 -i -p "Choose ouput:")
  case "$choice" in
  Earphones)
    earphones
    ;;
  Airdopes)
    airdopes
    ;;
  Speakers)
    speaker
    ;;
  Headphones)
    headphones
    ;;
  esac

}
audioout

#need attention.got auto-audio-selecet script from the internet so will be continued if needed

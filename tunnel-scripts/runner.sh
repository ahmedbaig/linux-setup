#!/usr/bin/env bash

HEIGHT=25
WIDTH=100
CHOICE_HEIGHT=4
BACKTITLE="Welcome to script runner"
TITLE="SCRIPT RUNNER"
MENU="Choose one of the following options:"

OPTIONS=(
  1 "System SSH tunnel setup"
  2 "Copy your external IP to clipboard"
)

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
CURRENT_PATH=$(cd -- "$(dirname "$0")" && pwd -P)
case $CHOICE in
  1)
    echo "Selected SSH Tunneling Setup"
    $CURRENT_PATH/init.sh
    ;;
  2)
    echo "Your external IP" "+++" $(curl --silent https://ipinfo.io/ip) "+++ is copied to clipboard"
    echo $(curl --silent https://ipinfo.io/ip) | pbcopy
    ;;
esac

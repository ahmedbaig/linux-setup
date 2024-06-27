#!/usr/bin/env bash

HEIGHT=25
WIDTH=70
CHOICE_HEIGHT=4
BACKTITLE="Welcome to script runner"
TITLE="SCRIPT RUNNER"
MENU="Choose one of the following options:"

OPTIONS=(
  1 "System SSH tunnel setup"
  2 "Copy your external IP to clipboard"
  3 "Connect to (192.168.7.101) Internal Stack Atlas"
  4 "Connect to (192.168.16.57) Atlas Staging 1"
  5 "Connect to (192.168.16.56) Atlas Staging 2"
  6 "Connect to (192.168.16.167) Rapid Link Staging"
  7 "Connect to (52.65.238.187) Camera Capture Test VM"
  8 "Connect to (192.168.7.100) Atlas Macquarie Park Production"
  9 "Connect to (192.168.3.100) Atlas Haymarket Production"
  10 "Connect to (192.168.7.30) Rapid Link Macquarie Park Production"
  11 "Connect to (192.168.3.150) Rapid Link Haymarket Production"

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
SCRIPTS_PATH="/Users/ahmedbaig/Work/configurations/linux-setup"
case $CHOICE in
  1)
    echo "Selected SSH Tunneling Setup"
    $CURRENT_PATH/init.sh
    ;;
  2)
    echo "Your external IP" "+++" $(curl --silent https://ipinfo.io/ip) "+++ is copied to clipboard"
    echo $(curl --silent https://ipinfo.io/ip) | pbcopy
    ;;
  3)
    echo "Connecting to Internal Stack Atlas ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.7.101 ~/.ssh/id_rsa ahmed.baig
    ;;
  4)
    echo "Connecting to Atlas Staging 1 ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.16.57 ~/.ssh/id_rsa ahmed.baig
    ;;
  5)
    echo "Connecting to Atlas Staging 2 ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.16.56 ~/.ssh/id_rsa ahmed.baig
    ;;
  6)
    echo "Connecting to Rapid Link Staging ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.16.167 ~/.ssh/id_rsa ahmed.baig
    ;;
  7)
    echo "Connecting to Camera Capture Test VM ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 52.65.238.187 ~/.ssh/test-ffmpeg-custom-vm.pem ubuntu
    ;;
  8)
    echo "Connecting to Atlas Macquarie Park Production ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.7.100 ~/.ssh/id_rsa ahmed.baig
    ;;
  9)
    echo "Connect to Atlas Haymarket Production ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.3.100 ~/.ssh/id_rsa ahmed.baig
    ;;
  10)
    echo "Connect to Rapid link Haymarket Production ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.7.30 ~/.ssh/id_rsa ahmed.baig
    ;;
  11)
    echo "Connect to Rapid link Haymarket Production ..."
    $SCRIPTS_PATH/ssh-scripts/connect.sh 192.168.3.150 ~/.ssh/id_rsa ahmed.baig
    ;;
esac

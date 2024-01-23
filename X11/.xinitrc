#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

########################
# Status Bar Functions #
########################

# Battery

batt(){
  batt="$(cat /sys/class/power_supply/BAT0/capacity)"
  echo -e " $batt%"
}

# Date

dte(){
  dte="$(date +"%A, %d %b")"
  echo -e " $dte"
}

tme() {
  tme="$(date +"%I:%M")"
  echo -e " $tme"
}

upg() {
  upg="$(pacman -Qu | wc -l)"
  echo -e " $upg"
}

# VPN IP Address

vpn() {
 if [ "1" == $(ifconfig | grep tun0 | wc -l) ];
  then
   vpn="$(ip a | grep "tun0" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}")"
   echo " tun0 $vpn"
 else
    vpn="$(curl https://ifconfig.me ; echo)"
   echo " wlan0 $vpn"
 fi
}

# Battery Notification Function

batt_notify() {

  FULL_BATT=99
  THREE_BATT=75
  HALF_BATT=50
  LOW_BATT=25
  CRITICAL_BATT=10
  if [ $(cat /sys/class/power_supply/BAT0/capacity) -eq $HALF_BATT ]
  then
    exec $(notify-send --urgency=normal " Battery: $(cat /sys/class/power_supply/BAT0/capacity)%" -t 5000)

  elif [ $(cat /sys/class/power_supply/BAT0/capacity) -eq $LOW_BATT ]
  then
    exec $(notify-send --urgency=normal " Battery: $(cat /sys/class/power_supply/BAT0/capacity)%" -t 5000)

  elif [ $(cat /sys/class/power_supply/BAT0/capacity) -eq $CRITICAL_BATT ]
  then
    exec $(notify-send --urgency=critical " Battery: $(cat /sys/class/power_supply/BAT0/capacity)%" -t 5000)

  elif [ $(cat /sys/class/power_supply/BAT0/capacity) -eq $FULL_BATT ]
  then
    exec $(notify-send --urgency=low " Battery: $(cat /sys/class/power_supply/BAT0/capacity)%" -t 5000)

  elif [ $(cat /sys/class/power_supply/BAT0/capacity) -eq $THREE_BATT ]
  then
    exec $(notify-send --urgency=low " Battery: $(cat /sys/class/power_supply/BAT0/capacity)%" -t 5000)

  fi
}

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

###################################
# Picom, DWM, Status Bar, and Feh #
###################################


# Start Picom

picom &

# Status Bar

while true; do
  xsetroot -name " $(vpn) | $(upg) | $(batt) | $(dte) | $(tme)"
  sleep 1m # updates every minute
done &

# Wallpaper

~/.fehbg

# Start DWM

exec /usr/local/bin/dwm


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#

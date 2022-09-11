#!/bin/sh

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

picom --experimental-backends -b &

# Status Bar

while true; do
  xsetroot -name " $(batt) | $(dte) | $(tme)"
  sleep 1m # updates every minute
done &

# Wallpaper

~/.fehbg

# Start DWM

exec /usr/local/bin/dwm

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------#


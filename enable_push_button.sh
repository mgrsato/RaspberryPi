#!/bin/sh

gpio -g mode 24 in #SW1
gpio -g mode 23 in #SW2
gpio -g mode 18 in #SW3

gpio -g mode 22 out #LED1(RED)
gpio -g mode 27 out #LED2(GREEN)
gpio -g mode 17 out #LED3(BLUE)

while :
do
  gpst1=$(gpio -g read 24) #GPIO 24 read
  gpst2=$(gpio -g read 23) #GPIO 23 read
  gpst3=$(gpio -g read 18) #GPIO 18 read
  
  if [ $gpst1 = 1 ] ; then
    gpio -g write 22 1
  else
    gpio -g write 22 0
    echo "SW1 PRESSED"
    /home/pi/post_ip_address.sh
  fi
  
  if [ $gpst2 = 1 ] ; then
    gpio -g write 27 1
  else
    gpio -g write 27 0
    echo "SW2 PRESSED"
    /home/pi/post_env_data.sh
  fi
  
  if [ $gpst3 = 1 ] ; then
    gpio -g write 17 1
  else
    gpio -g write 17 0
    echo "SW3 PRESSED"
    sudo shutdown -h now
  fi
  
  sleep 1s
done

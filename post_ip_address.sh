#!/bin/sh

wlan0=`ip a show wlan0 | grep "inet " | cut -d " " -f 6 | cut -d "/" -f 1`
eth0=`ip a show eth0 | grep "inet " | cut -d " " -f 6 | cut -d "/" -f 1`

URL="https://maker.ifttt.com/trigger"
EVENTNAME="raspberry_pi"
YOUR_KEY="＊＊＊＊＊＊"

curl -X POST "${URL}/${EVENTNAME}/with/key/${YOUR_KEY}?value1=${wlan0}&value2=${eth0}&value3=${EVENTNAME}"

exit 0

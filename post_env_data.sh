#!/bin/sh

temperature=`python bme280_c.py -t`
humidity=`python bme280_c.py -h`
pressure=`python bme280_c.py -p`

temperature=`printf "%.2f" $temperature`
humidity=`printf "%.2f" $humidity`
pressure=`printf "%.2f" $pressure`

URL="https://maker.ifttt.com/trigger"
EVENTNAME="raspberry_pi_env"
YOUR_KEY="i_BoH2-Jv_YogejwjkPlK"

curl -X POST ${URL}/${EVENTNAME}/with/key/${YOUR_KEY}?value1=${temperature}"&"value2=${humidity}"&"value3=${pressure}

echo
exit 0

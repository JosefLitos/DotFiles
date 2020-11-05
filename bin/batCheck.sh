#!/bin/bash
#This script checks the battery status and warns the user if battery is bellow 10%

declare BAT="/sys/class/power_supply/BAT0"

#exits, if battery not present
test -e $BAT || exit
# warns the user by changing backlight
# requires 3 params: loop_count sleep_time light_change
alarm() {
	backlight=$(xbacklight)
	i=$1
	while [ $i -gt 0 ]
	do
		xbacklight = 100
		sleep $2
		xbacklight = $3
		sleep $2
		let i--
	done

	xbacklight = $backlight
}

while [ true ]
do
	while [ `cat $BAT/status` == "Charging" ]
	do
		if [ `cat $BAT/capacity` -eq 100 ]; then
			alarm 1 1 0
		fi
		sleep 5m
	done

	warn=10
	loop=2
	light=40
	while [ `cat $BAT/status` != "Charging" ]
	do
		while [ `cat $BAT/capacity` -gt $warn ]
		do
			sleep 1m
		done

		if [ $warn -eq 4 ]; then
			shutdown now
		fi

		alarm $loop 0.2 $light
		let warn=warn-2
		let loop=loop\*2-1
		let light=light-10
	done
done

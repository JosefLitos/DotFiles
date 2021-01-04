#!/usr/bin/bash
#i3/floatpos.sh -i3 floating mode tiling functionality like in Windows
# Made by Kepis, enjoy your linux i3WindowsWM setup

#for usage in tiling mode
if [[ `xprop -id $(xdotool getactivewindow)` != *"I3_FLOATING_WINDOW"* ]]; then
	case "$1" in
		"up") i3 move up;;
		"down") i3 move down;;
		"left") i3 move left;;
		"right") i3 move right;;
		"c") i3 split toggle;;
	esac
	exit
fi

#get window pos and size
unset x y w h
eval $(xwininfo -id $(xdotool getactivewindow) |
  sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
         -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
         -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
         -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
let x--
let y--
let w=w+2
let h=h+2
# height of the status bar
bar=0
# half if the available height
let halfsz=540-$bar/2
# the second half of the available screen
let halfscr=$halfsz+$bar
# available height
let height=1080-$bar

#Setts window default size (quarter of the screen) and centers it
defsize() {
	i3 resize set 960 $halfsz
	i3 move position center
}

#Manages 'up' action
up() {
	if [ "$p2" == "shift" ]; then
		i3 move position $x 0
	elif [ $y == $bar ]; then
		case "$h" in
			"$height") i3 resize set height $halfsz;;
			*)
				i3 move position 0 $bar
				i3 resize set 1920 $height;;
		esac
	elif [ $(expr $y + $h) == 1080 ]; then
		if [ $w -gt 1550 ]; then
			defsize
		elif [ $h -le 600 ]; then
			i3 move position $x $bar
			i3 resize set height $height
		else
			i3 move position $x $bar
			i3 resize set height $halfsz
		fi
	else
		i3 move position $x $bar
	fi
}

#Manages 'down' action
down() {
	if [ "$p2" == "shift" ]; then
		i3 move position $x $(expr 1080 - $h)
	elif [ $y == $bar ]; then
		if [ $w -gt 1550 ]; then
			defsize
		elif [ $h == $height ]; then
			i3 move position $x $halfscr
			i3 resize set height $halfsz
		else
			i3 resize set height $height
		fi
	elif [ $(expr $y + $h) == 1080 ]; then
		i3 move position 0 $halfscr
		i3 resize set 1920 $halfsz
	else
		i3 move position $x $(expr 1080 - $h)
	fi
}

#Manages 'left' action
left() {
	if [ "$p2" == "shift" ]; then
		i3 move position 0 $y
	elif [ $x == 0 ] && [ $w -le 1550 ]; then
		i3 move position $(expr 1920 - $w) $y
	elif [ $x -gt 910 ]; then
		defsize
	else
		i3 move position 0 $bar
		i3 resize set 960 $height
	fi
}

#Manages 'right' action
right() {
	if [ "$p2" == "shift" ]; then
		i3 move position $(expr 1920 - $w) $y
	elif [ $(expr $x + $w) == 1920 ] && [ $w -le 1550 ]; then
		i3 move position 0 $y
	elif [ $(expr $x + $w) -le 1010 ]; then
		defsize
	else
		i3 move position 960 $bar
		i3 resize set 960 $height
	fi
}

p2="$2"
case "$1" in
	"up") up;;
	"down") down;;
	"left") left;;
	"right") right;;
	"c") i3 move position center;;
esac


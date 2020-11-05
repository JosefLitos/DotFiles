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
echo -n "$x $y $w $h "

#Setts window default size (quarter of the screen) and centers it
defsize() {
	i3 resize set 960 528
	i3 move position center
}

#Manages 'up' action
up() {
	if [ $y == 24 ]; then
		case "$h" in
			"1056") i3 resize set height 528;;
			*)
				i3 move position 0 24
				i3 resize set 1920 1056;;
		esac
	elif [ `expr $y + $h` == 1080 ]; then
		if [ $w -gt 1550 ]; then
			defsize
		elif [ $h -le 600 ]; then
			i3 move position $x 24
			i3 resize set height 1056
		else
			i3 move position $x 24
			i3 resize set height 528
		fi
	else
		i3 move position $x 24
	fi
}

#Manages 'down' action
down() {
	if [ $y == 24 ]; then
		if [ $w -gt 1550 ]; then
			defsize
		elif [ $h == 1056 ]; then
			i3 move position $x 552
			i3 resize set height 528
		else
			i3 resize set height 1056
		fi
	elif [ `expr $y + $h` == 1080 ]; then
		i3 move position 0 552
		i3 resize set 1920 528
	else
		i3 move position $x `expr 1080 - $h`
	fi
}

#Manages 'left' action
left() {
	if [ $x == 0 ] && [ $w -le 1550 ]; then
		i3 move position `expr 1920 - $w` $y
	elif [ $x -gt 910 ]; then
		defsize
	else
		i3 move position 0 24
		i3 resize set 960 1056
	fi
}

#Manages 'right' action
right() {
	if [ `expr $x + $w` == 1920 ] && [ $w -le 1550 ]; then
		i3 move position 0 $y
	elif [ `expr $x + $w` -le 1010 ]; then
		defsize
	else
		i3 move position 960 24
		i3 resize set 960 1056
	fi
}

case "$1" in
	"up") up;;
	"down") down;;
	"left") left;;
	"right") right;;
	"c") i3 move position center;;
esac


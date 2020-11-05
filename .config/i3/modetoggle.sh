#!/usr/bin/bash
# Toggles between i3 default tiling, or floating, mode

mode=none
case "$1" in
	"tiling") mode="floating";;
	"floating") mode="tiling";;
	*) exit;;
esac
case "$2" in
	"reload") mode=$1;;
	"restart") mode=$1;;
esac

rm ~/.config/i3/config
cp ~/.config/i3/def.config ~/.config/i3/config
sed -i '10iset $mode '$mode ~/.config/i3/config
if [ $mode == "floating" ]; then
	echo "
for_window [class=\".*\"] floating enable"	>> ~/.config/i3/config
fi
if [ $2 == "restart" ]; then
	i3 restart
else
	i3 reload
fi

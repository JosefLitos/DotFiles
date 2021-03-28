#!/bin/sh
if [ "$3" = a ]; then
	echo '{ XK_'$1',         ShiftMask,                      "\033['$2';2u",  0,  0},
{ XK_'$1',         Mod1Mask,                       "\033['$2';3u",  0,  0},
{ XK_'$1',         Mod1Mask|ShiftMask,             "\033['$2';4u",  0,  0},
{ XK_'$1',         ControlMask,                    "\033['$2';5u",  0,  0},
{ XK_'$1',         ControlMask|ShiftMask,          "\033['$2';6u",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask,           "\033['$2';7u",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask|ShiftMask, "\033['$2';8u",  0,  0},' >> keys.h
elif [ "$3" = b ]; then
	echo '{ XK_'$1',         XK_NO_MOD,                      "\033O'$2'",  0, +1},
{ XK_'$1',         XK_NO_MOD,                      "\033['$2'",  0, -1},
{ XK_'$1',         ShiftMask,                      "\033[1;2'$2'",  0,  0},
{ XK_'$1',         Mod1Mask,                       "\033[1;3'$2'",  0,  0},
{ XK_'$1',         Mod1Mask|ShiftMask,             "\033[1;4'$2'",  0,  0},
{ XK_'$1',         ControlMask,                    "\033[1;5'$2'",  0,  0},
{ XK_'$1',         ControlMask|ShiftMask,          "\033[1;6'$2'",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask,           "\033[1;7'$2'",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask|ShiftMask, "\033[1;8'$2'",  0,  0},' >> keys.h
elif [ "$3" = c ]; then
	echo '{ XK_'$1',         XK_NO_MOD,                      "\033['$2'~",   0, 0},
{ XK_'$1',         ShiftMask,                      "\033['$2';2~",  0,  0},
{ XK_'$1',         Mod1Mask,                       "\033['$2';3~",  0,  0},
{ XK_'$1',         Mod1Mask|ShiftMask,             "\033['$2';4~",  0,  0},
{ XK_'$1',         ControlMask,                    "\033['$2';5~",  0,  0},
{ XK_'$1',         ControlMask|ShiftMask,          "\033['$2';6~",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask,           "\033['$2';7~",  0,  0},
{ XK_'$1',         Mod1Mask|ControlMask|ShiftMask, "\033['$2';8~",  0,  0},' >> keys.h
else
 echo '1=key name; 2=ending; 3=ending form:
a=[$2;xu define key itself: b=[1;x$2 c=[$2;x~
'
fi

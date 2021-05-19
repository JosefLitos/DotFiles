#!/usr/bin/fish

# java
export _JAVA_AWT_WM_NONREPARENTING=1
# use bat to color man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_DEFAULT_COMMAND='rg --hidden -l ""'

set -x READER nvim
set -x EDITOR nvim
set -x BROWSER firefox
set -x TERMINAL st

function fish_greeting
end

function fish_title
	printf (basename $PWD)" - Fish"
end

function fish_prompt
	set -l last_status $status
	set_color -b '#181818'
	[ $last_status = 0 ] && set_color brgreen -o || set_color brred -o
		printf "$last_status "
	set_color normal
	set_color -b '#181818'
	set_color blue
		printf '@'
	set_color brblue
		printf $hostname
	set_color bryellow -o	
		printf ':'
	set_color normal
	set_color -b '#181818'
	set_color brmagenta
		printf (basename $PWD)' '
	if [ "$USER" = 'root' ]
		set_color red -o
			printf '#'
	else
		set_color brgreen -o
		printf '$'
	end
	set_color normal
	set_color '#181818'
		printf ' '

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end

abbr sr 		"sudo ranger"
abbr s 			"sensors"
abbr cp 		"cp -i"
abbr mv 		"mv -i"
abbr smci		"sudo make clean install"

# get error messages from journalctl
abbr jctl 		"journalctl -p 3 -xb"

# pacman
abbr p 			"paru"
abbr pc 		"paru -Sc"
abbr pror 	"paru -Rscn (paru -Qqtd)"
abbr pss 		"paru -S (paru -Slq | fzf -m --preview 'paru -Si {1}'  --preview-window="wrap")"
abbr psr 		"paru -Rscn (paru -Qeq | fzf -m --preview 'paru -Si {1}'  --preview-window="wrap")"

# navigation
abbr fd 		'ranger --choosedir=/dev/shm/rdir; cd (cat /dev/shm/rdir)'
abbr gt 		'cd (dirname (fzf))'
abbr of			'$EDITOR (fzf -e)'
abbr ...    'cd ../..'
abbr cu 		"cd /usr/"
abbr ce 		"cd /etc/"
abbr cds 		"cd ~/Documents/AvAvA/server/src/"
abbr cdb 		"cd ~/Documents/BookExchange/backend"
abbr cdq 		"cd ~/Documents/PG/QuickNodeRequests"
abbr cdd 		"cd ~/dotfiles"
abbr dup 		"cd ~/dotfiles; git pull"

# quick program info fetch
abbr xp 		"xprop | grep -e '^_NET_WM_WINDOW_TYPE' -e '^WM_NAME' -e '^WM_CLASS' | sed 's/^.*_\(.*\)(.*) = /\1 = /'"
# detect keys pressed
abbr xev 		"xev | grep keysym | awk '{ print \$7 }' | sed 's/),//'"
# wifi - nmtui is better, but this is hand-made
abbr il 		"nmcli device wifi | sed -n 's/^\*//;/:/p' | awk '{ print \$8\"\t\"\$2 }'"
abbr ic 		"nmcli device wifi connect"

function fish_user_key_bindings
	fzf_key_bindings
end

function ramuse
	ps axo rss,comm,pid \
                | awk '{ proc_list[$2]++; proc_list[$2 "," 1] += $1; } \
                END { for (proc in proc_list) { printf("%d\t%s\n", \
                proc_list[proc "," 1],proc); }}' | sort -n | tail -n 10 | sort -rn \
                | awk '{$1/=1024;printf "%.0fMB\t",$1}{print $2}'
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end


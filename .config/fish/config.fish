#!/usr/bin/fish

# java
export _JAVA_AWT_WM_NONREPARENTING=1
# use bat to color man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#set PATH $PATH (du "$HOME/bin" | cut -f2 | tr '\n' ':')
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
	[ $last_status = 0 ] && set_color '#77ff00' -o || set_color '#dc1e0e' -o
		printf "$last_status "
	set_color normal
	set_color -b '#181818'
	set_color '#1166ff'
		printf '@'
	set_color '#22aaff'
		printf $hostname
	set_color '#ffee00'
		printf ':'
	set_color '#bb1eaa'
		printf (basename $PWD)' '
	if [ "$USER" = 'root' ]
		set_color '#dc1e0e' -o
			printf '#'
	else
		set_color '#77ff00' -o
		printf '$'
	end
	set_color normal
	set_color '#181818'
		printf ' '

	# del key does not work properly by itself
	printf '\033[?1h\033=' >/dev/tty
end

abbr sr 			"sudo ranger"
abbr s 				"sensors"
abbr cp 			"cp -i"
abbr mv 			"mv -i"

# get error messages from journalctl
abbr jctl 		"journalctl -p 3 -xb"

# pacman
abbr p 			"paru"
abbr pc 			"paru -Sc"
abbr pror 		"paru -Rscn (paru -Qqtd)"
abbr pss 		"paru -Slq | fzf -m --preview 'paru -Si {1}'  --preview-window="wrap" | xargs -ro  paru -S"
abbr psr 		"paru -Qeq | fzf -m --preview 'paru -Si {1}'  --preview-window="wrap" | xargs -ro  paru -Rscn"

# navigation
abbr ..  		"cd .."
abbr ... 		"cd ../.."
abbr cu 		"cd /usr/"
abbr ce 		"cd /etc/"
abbr cds 		"cd ~/Documents/AvAvA/server/src/"

# quick program fetch
abbr xp 		" xprop | grep -e '^_NET_WM_WINDOW_TYPE' -e '^WM_NAME' -e '^WM_CLASS' | sed 's/^.*_\(.*\)(.*) = /\1 = /'"
# detect keys pressed
abbr xev 		"xev | grep keysym | awk '{ print \$7 }' | sed 's/),//'"
# wifi
abbr il 			"nmcli device wifi | sed -n 's/^\*//;/:/p' | awk '{ print \$8\"\t\"\$2 }'"
abbr ic 			"nmcli device wifi connect"

# git \ abbr push 		"git remote | xargs -L1 git push --all"

function fish_user_key_bindings
	fzf_key_bindings
end

function fzf-dir-cd
	cd (dirname (locate home media | fzf -i -e))
end

function fzf-full-cd
	cd (dirname (locate / | fzf -i -e))
end

function fzf-file-edit
	find ~/.config ~/.local ~/.scripts ~/* -type f | fzf -i -e | xargs -r $EDITOR
end

bind \cg fzf-file-edit

if bind -M insert > /dev/null 2>&1
	bind -M insert \cg fzf-file-edit
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


#!/usr/bin/sh

# This I use for my own use, simply put, it installs all the packages I need.
# Aside of system defaults, such as: base, base-devel, linux, git, sudo
paru -S $(printf \
	'acpi
alsa-utils
arandr
auto-cpufreq
bc
bat
corectrl
dosfstools
dunst
exa
fd
feh
fish
fzf
grub
gvfs-mtp
gvfs
htop
i3-gaps
i3blocks
i3lock
i3lock-fancy-rapid-git
i3title
imagemagick
inxi
libxft-bgra
linux-firmware
linux-headers
lua-format
man-db
man-pages
mpris-ctl
neovim-nightly-bin
nerd-fonts-inconsolata
networkmanager
nodejs
notepadqq
npm
ntfs-3g
os-prober
otf-font-awesome
otf-overpass
pacman-contrib
pandoc-bin
paru-bin
pavucontrol
pcmanfm-gtk3
picom-ibhagwan-git
prettier
pulseaudio
python-pynvim
qt5ct
ranger
reflector
ripgrep
rofi
rofi-dmenu
scrot
shfmt
texinfo
ttf-exo-2
ttf-fira-code
ttf-joypixels
ttf-nova
ueberzug
ufw
w3m
xclip
xdotool
xf86-input-synaptics
xf86-video-intel
xorg-xbacklight
xorg-xev
xorg-xgamma
xorg-xinit
xorg-xinput
xorg-xkbutils
xorg-xkill
xorg-xrandr
xorg-xwininfo
yapf')

# Applications installation
if [ "$1" == "-a" ]; then
	paru -S $(printf \
		'brave-bin
discord
engrampa
firefox
gimp
gnu-netcat
glxinfo
gparted
handbrake
inkscape
jdk-openjdk
jdk8-openjdk
kdenlive-appimage
libreoffice-fresh-cs
libreoffice-fresh-de
lxappearance-gtk3
min
neofetch
netbeans
network-manager-applet
openssh
p7zip
polkit-gnome
scrcpy
thunderbird-bin
torbrowser-launcher
transmission-gtk
vlc\n')
	git clone https://github.com/JosefLitos/st.git && cd st && sudo make clean install && cd .. && rm
	-r st
fi

if [ "$1" == "-h" ]; then printf "use -a to install all applications\n"; fi

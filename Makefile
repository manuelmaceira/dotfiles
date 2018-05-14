install: arch yay dirs stow

update:
	git pull
	git submodule init
	git submodule update --remote

dirs:

yay: arch
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si

arch:
	pacman -Sy --noconfirm gcc gdb zsh git
	pacman -Sy --noconfirm python python-pip python2
	pacman -Sy --noconfirm texlive-most biber
	pacman -Sy --noconfirm asciiquarium cmatrix
	pacman -Sy --noconfirm vim neovim python-neovim
	pacman -Sy --noconfirm i3-gaps
	pacman -Sy --noconfirm asciinema

aur: yay
	yay --answeredit None --answerclean All -Sy i3lock-color-git
	yay --answeredit None --answerclean All -Sy polybar

stow: stow-base stow-root
	stow i3
	stow polybar
	stow ranger
	stow scripts
	stow zsh

stow-work: stow-base
	stow i3-work
	stow polybar-work
	stow ranger-work
	stow scripts-work
	stow zsh-work

stow-root: arch
	stow -t / udev
	stow -t / systemd
	stow -t / lightdm
	udevadm control --reload
	systemctl enable wakelock.service
	systemctl enable powertop.service
	systemctl start wakelock.service
	systemctl start powertop.service

stow-base: update
	stow bash
	stow cava
	stow compton
	stow ctags
	stow documents
	stow dunst
	stow gnupg
	stow gtk
	stow khal
	stow khard
	stow lightdm
	#stow mozilla # requires changing folder name
	stow mpv
	stow msmtp
	stow mutt
	stow ncpamixer
	stow neofetch
	stow neovim
	stow newsboat
	stow offlineimap
	stow pacman
	stow pass
	stow qutebrowser
	stow readline
	stow rtorrent
	stow rtv
	stow scim
	stow ssh
	stow systemd
	stow t
	stow tmux
	stow udev
	stow urlview
	stow urxvt
	stow vdirsyncer
	stow wal
	stow weechat
	stow xdgopen
	stow zathura
	mkdir -p ~/.tasks

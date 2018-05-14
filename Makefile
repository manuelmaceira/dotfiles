yay: base
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si

base:
	sudo pacman -Sy gcc gdb zsh git
	sudo pacman -Sy python python-pip python2
	sudo pacman -Sy texlive-most biber
	sudo pacman -Sy asciiquarium cmatrix
	sudo pacman -Sy vim neovim python-neovim
	sudo pacman -Sy i3-gaps

aur: yay
	yay --answeredit None --answerclean All -Sy i3lock-color-git

dirs:
	mkdir -p ~/.tasks

arch: base yay dirs
	sudo pacman -Syu

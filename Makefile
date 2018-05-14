yay: base
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	cd /tmp/yay
	makepkg -si

base:
	sudo pacman -S gcc gdb zsh git
	sudo pacman -S python python-pip python2
	sudo pacman -S texlive-most biber
	sudo pacman -S asciiquarium cmatrix
	sudo pacman -S vim neovim python-neovim
	sudo pacman -S i3-gaps

aur: yay
	yay --answeredit None --answerclean -S i3lock-color-git

dirs:
	mkdir -p ~/.tasks

arch: base yay dirs
	sudo pacman -Syu

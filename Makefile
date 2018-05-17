USER=micah

install: packages stow

update:
	git pull
	git submodule init
	git submodule update --remote

packages: pacman arch yay aur

pacman:
	sudo mv pacman/etc/pacman.conf /etc/pacman.conf

yay: arch
	sudo rm -rf /tmp/yay
	git clone https://aur.archlinux.org/yay.git /tmp/yay
	(cd /tmp/yay && makepkg -si)

arch: pacman
	mkdir -p ~/Documents ~/Downloads ~/Music ~/Pictures ~/Videos
	sudo pacman -Sy --needed --noconfirm \
		alsa-utils \
		aria2 \
		asciinema \
		asciiquarium \
		acpi_call-dkms \
		biber \
		cmatrix \
		compton \
		cronie \
		ctags \
		cups \
		cups-pdf \
		dhclient \
		dialog \
		dmenu \
		docker \
		dunst \
		exfat-utils \
		fd \
		feh \
		firefox \
		gcc-fortran \
		gdb \
		gimp \
		git \
		gparted \
		htop \
		i3-gaps \
		imagemagick \
		intel-ucode \
		jdk8-openjdk \
		jq \
		lib32-fontconfig \
		lib32-gtk2 \
		lib32-libcanberra \
		lib32-libpng12 \
		lib32-libudev0-shim \
		lib32-libxft \
		lib32-libxt \
		lib32-libxtst \
		libkeybinder3 \
		libmicrodns \
		libpng12 \
		libreoffice-fresh \
		lxappearance \
		mps-youtube \
		mpv \
		msmtp \
		neofetch \
		neomutt \
		neovim \
		network-manager-applet \
		networkmanager \
		ntp \
		openssh \
		pandoc \
		pandoc-citeproc \
		pass \
		pavucontrol \
		pdfpc \
		perl-anyevent-i3 \
		powertop \
		projectm-pulseaudio \
		pulseaudio \
		pulseaudio-alsa \
		pygmentize \
		python \
		python-dateutil \
		python-i3-py \
		python-jedi \
		python-neovim \
		python-pip \
		python-pyicu \
		python-pytz \
		python-setproctitle \
		python-urwid \
		python-virtualenv \
		python-vobject \
		python-websocket-client \
		python2 \
		python2-crypto \
		python2-i3-py \
		python2-pyparsing \
		python2-websocket-client \
		qutebrowser \
		r \
		ranger \
		reiserfsprogs \
		rhash \
		rtorrent \
		rubber \
		ruby \
		rxvt-unicode \
		scrot \
		smartmontools \
		stow \
		tcl \
		terminus-font \
		texlive-core \
		texlive-fontsextra \
		texlive-science \
		the_silver_searcher \
		tidy \
		tk \
		tlp \
		tmux \
		translate-shell \
		upower \
		urxvt-perls \
		vagrant \
		vim \
		virtualbox \
		vlc \
		w3m \
		weechat \
		wget \
		wicd \
		wireless_tools \
		wpa_supplicant \
		xclip \
		xdotool \
		xf86-video-vesa \
		xmlstarlet \
		xorg-server \
		xorg-xinit \
		zathura \
		zathura-pdf-poppler \
		zsh
	sudo systemctl enable tlp.service
	sudo systemctl enable tlp-sleep.service
	sudo systemctl enable org.cups.cupsd.service
	sudo systemctl start org.cups.cupsd.service
	chsh -s /bin/zsh $(USER)

aur: yay
	yay --answeredit None --answerclean All -Sy \
		aurutils \
		brother-dcp7065dn \
		cava \
		enpass-bin \
		envypn-font \
		i3lock-color-git \
		j4-dmenu-desktop-git \
		jmtpfs \
		libfprint-git \
		light \
		magnet2torrent-git \
		ncpamixer \
		networkmanager-dmenu-git \
		numix-icon-theme-git \
		oomox-git \
		otf-hasklig \
		pass-extension-tail \
		pass-update \
		pdftk \
		polybar \
		powerline-fonts-git \
		python2-pysqlcipher \
		python-milksnake \
		python-pywal \
		qt5-webengine-widevine \
		sc-im \
		siji-git \
		skypeforlinux-stable-bin \
		tamzen-font-git \
		tcllib \
		tilp \
		upass \
		urlscan \
		urlview \
		vdirsyncer-git \
		virtualbox-ext-oracle

stow: stow-base root-config
	stow -S \
		i3 \
		polybar \
		ranger \
		scripts \
		zsh

stow-work: stow-base
	stow -S \
		i3-work \
		polybar-work \
		ranger-work \
		scripts-work \
		zsh-work

root-config: yay
	mv systemd/etc/systemd/system/* /etc/systemd/system/
	sudo systemctl enable wakelock.service
	sudo systemctl enable powertop.service
	sudo systemctl start wakelock.service
	sudo systemctl start powertop.service

stow-base: update
	stow -S \
		bash \
		cava \
		compton \
		ctags \
		documents \
		dunst \
		gnupg \
		gtk \
		khal \
		khard \
		mpv \
		msmtp \
		mutt \
		ncpamixer \
		neofetch \
		neovim \
		newsboat \
		offlineimap \
		pass \
		qutebrowser \
		readline \
		rtorrent \
		rtv \
		scim \
		ssh \
		systemd \
		t \
		tmux \
		urlview \
		urxvt \
		vdirsyncer \
		wal \
		weechat \
		xdgopen \
		xinit \
		zathura \
		zsh
		mkdir -p ~/.tasks \

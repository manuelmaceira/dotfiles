USER=micah

.PHONY: install update packages pacman yay arch aur r-packages pip-packages stow stow-work person-configs work-configs root-config stow-pre stow-base stow-post

install: packages stow

update:
	# fully update git repository
	git pull
	git submodule update --init --recursive
	git submodule update --remote
	git -C /home/$(USER)/dotfiles/zsh/.zprezto checkout master

packages: pacman arch yay aur r-packages pip-packages

pacman:
	# place pacman config
	cp pacman/etc/pacman.conf /etc/pacman.conf

yay: arch
	# install yay aur helper
	rm -rf /tmp/yay
	sudo -u $(USER) git clone https://aur.archlinux.org/yay.git /tmp/yay
	(cd /tmp/yay && sudo -u $(USER) makepkg -si)
	rm -rf /tmp/yay

arch: pacman
	# create home folders
	sudo -u $(USER) mkdir -p /home/$(USER)/Documents /home/$(USER)/Downloads /home/$(USER)/Music /home/$(USER)/Pictures /home/$(USER)/Videos
	pacman -Sy --needed --noconfirm \
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
		khal \
		khard \
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
		python-pywal \
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
		vim \
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
		youtube-dl \
		zathura \
		zathura-pdf-poppler \
		zsh
	# start tlp
	systemctl enable tlp.service
	systemctl enable tlp-sleep.service
	systemctl start tlp.service
	systemctl start tlp-sleep.service
	# start cups
	systemctl enable org.cups.cupsd.service
	systemctl enable cups-browsed.service
	systemctl start org.cups.cupsd.service
	systemctl start cups-browsed.service
	# start cronie
	systemctl enable cronie.service
	systemctl start cronie.service
	# start ntp
	systemctl enable ntpd.service
	systemctl start ntpd.service
	# change shell to zsh
	chsh -s /bin/zsh $(USER)

aur: yay
	# install all aur packages
	sudo -u $(USER) yay --answeredit None --answerclean All -Sy \
		brother-dcp7065dn \
		cava \
		enpass-bin \
		envypn-font \
		i3lock-color-git \
		j4-dmenu-desktop-git \
		jmtpfs \
		light \
		magnet2torrent-git \
		ncpamixer \
		networkmanager-dmenu-git \
		numix-icon-theme-git \
		oomox-git \
		otf-hasklig \
		pass-extension-tail \
		pass-update \
		polybar \
		powerline-fonts-git \
		python-milksnake \
		qt5-webengine-widevine \
		rtv-git \
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

r-packages:
	Rscript -e "install.packages(c('bindr', 'DiagrammeR', 'knitr', 'reticulate', 'rmarkdown'), repos='https://cran.rstudio.com')"

pip-packages:
	pip install --upgrade pip
	pip install \
		gpymusic \
		picon

stow: stow-base personal-configs root-config stow-post

stow-work: stow-base work-configs stow-post

personal-configs: stow-base
	# stow personal configs
	sudo -u $(USER) stow -S \
		i3 \
		polybar \
		ranger \
		scripts \
		zsh

work-configs: stow-base
	# stow work configs
	sudo -u $(USER) stow -S \
		i3-work \
		polybar-work \
		ranger-work \
		scripts-work \
		zsh-work

root-config:
	# copy and start custom systemd services
	cp systemd-root/etc/systemd/system/* /etc/systemd/system/
	systemctl enable wakelock.service
	systemctl enable powertop.service
	systemctl start wakelock.service
	systemctl start powertop.service

stow-pre:
	# remove configs that will already exist
	-[ -L /home/$(USER)/.bashrc ] && mv /home/$(USER)/.bashrc /home/$(USER)/.bashrc.bak
	-[ -L /home/$(USER)/.config/cava ] && mv /home/$(USER)/.config/cava /home/$(USER)/.config/cava.bak
	# create folder that might not be created yet for configs
	sudo -u $(USER) mkdir -p /home/$(USER)/.local/share/applications /home/$(USER)/.config

stow-base: update stow-pre
	# stow all
	sudo -u $(USER) stow -S \
		antigen \
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
		tmuxinator \
		urlview \
		urxvt \
		vdirsyncer \
		wal \
		weechat \
		xdgopen \
		xinit \
		zathura \
		zsh

stow-post:
	# create folder for t task manager
	sudo -u $(USER) mkdir -p /home/$(USER)/.tasks
	# neovim vim-plug initialization
	sudo -u $(USER) nvim +'PlugInstall --sync' +qa
	# set wallpaper and run pywal
	sudo -u $(USER) cp default-wall.jpg ~/.config/wall
	sudo -u $(USER) wal -g -c -i ~/.config/wall -o ~/.config/Scripts/wal-set

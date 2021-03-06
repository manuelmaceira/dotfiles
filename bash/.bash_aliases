if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias sl='sl -e'
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'
alias cdb='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='rsync'
alias cpr='rsync -r'
alias speedtest='speedtest-cli'
alias alsamixer='alsamixer -c 1'
alias gdrive='google-drive-ocamlfuse ~/Google\ Drive/'
alias ugdrive='sudo umount ~/Google\ Drive/'
alias todo='vi ~/.todo'
alias dataBackup='/home/micah/backupScript/backup.sh'
alias dataBackupUmount='/home/micah/backupScript/backup.sh && sleep 5 && sudo umount /dev/sdd1'
alias makescript="fc -rnl | head -1 >"
alias histg='history | grep'
alias cmount='mount | column -t'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias tree2="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias meminfo='free -m -l -t'
alias ps?='ps aux | grep'
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"
alias bashrc="vi ~/.bashrc"
alias bashalias="vi ~/.bash_aliases"
alias katawa="/home/micah/data/Videos/Anime/Visual\ Novels/Katawa\ Shoujo-linux/Katawa\ Shoujo.sh"
alias python="python3"
alias mysql="mysql -u root -p"
alias aptclean="sudo apt-get autoremove ; sudo apt-get autoclean; sudo apt-get install -f ; sudo apt-get clean"
alias aptupgrade="sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade ; sudo apt-get -y autoremove ; sudo apt-get -y autoclean; sudo apt-get -y install -f ; sudo apt-get -y clean"

alias setCurrentProject='pwd > ~/.current_project'
alias currentProject='cd `cat ~/.current_project`'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}
mcd() { mkdir -p "$1"; cd "$1";}
cls() { cd "$1"; ls;}
crun() { make "$1"; ./$1;}
backup() { cp "$1"{,.bak};}
md5check() { md5sum "$1" | grep "$2";}
ctree() { cd "$1"; ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'; cd -; }
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.tar.xz)   tar xf $1       ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      unrar e $1      ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.txz)      tar xf $1       ;;
            *.zip)      unzip $1        ;;
            *.z)        uncompress $1   ;;
            *.7z)       7z x $1         ;;
            *.jar)      jar xf $1       ;;
            *)  echo "'$1' cannot be extracted via extract()"
             esac
    else
        echo "'$1' is not a valid file"
    fi
}

#C compiling shortcuts for clang and gcc
clang() {
    if [[ $1 =~ \.c$ ]]; then
        clang-3.5 -g $1 -o ${1%%.*}; 
    else
        echo "$1 is not a c file"
    fi
}
clanglm() {
    if [[ $1 =~ \.c$ ]]; then
        clang-3.5 -g $1 -o ${1%%.*} -lm; 
    else
        echo "$1 is not a c file"
    fi
}
gccc() {
    if [[ $1 =~ \.c$ ]]; then
        gcc -std=c99 -Wall -pedantic -Wextra -Werror -O2 -g $1 -o ${1%%.*}; 
    else
        echo "$1 is not a c file"
    fi
}
gcclm() {
    if [[ $1 =~ \.c$ ]]; then
        gcc -std=c99 -g $1 -o ${1%%.*} -lm; 
    else
        echo "$1 is not a c file"
    fi
}

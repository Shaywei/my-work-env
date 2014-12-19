if [ -z "$SSH_AUTH_SOCK" ] ; then
	ssh-add ~/.ssh/spotify_rsa
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

# Always enable GREP colors
export GREP_OPTIONS='--color=auto'

function gerclone () {
   git clone shay@git.spotify.net:$1
   cd ${1%.git}
   git submodule update --init --recursive
}

function gheclone () {
   git clone git@ghe.spotify.net:$1.git
   cd ${1#*/}
   git submodule update --init --recursive
}


alias ll='ls -al'

# a little script that extracts archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

alias vimbash='vim ~/.bashrc'

alias gpush="git push origin `git rev-parse --abbrev-ref HEAD`"
alias gerpush="git push origin `git rev-parse --abbrev-ref HEAD`:refs/for/`git rev-parse --abbrev-ref HEAD` --no-thin"
alias gerpushprod="git push origin `git rev-parse --abbrev-ref HEAD`:refs/for/production --no-thin"
alias jump="ssh -A jump1.sto.spotify.net"
alias devadmin="ssh -A lon3-devadmin-a1"


alias gd="git diff"
alias gdf="git diff --name-only"
alias gdc="git diff --cached"
alias gl="git log --pretty=oneline --abbrev-commit --date=relative"
alias co="git checkout"
alias gb="git checkout -b"
alias gpush="git push --progress"
alias gpull="git pull -v --progress"
alias gdb="git branch -d"
alias gaa="git add ."
alias gai="git add -i"
alias gunadd="git rm --cached"

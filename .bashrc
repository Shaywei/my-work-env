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


function edit () {
   /Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text $1&
}

alias ll='ls -al'
alias vimbash='vim ~/.bashrc'
alias gpush="git push origin `git rev-parse --abbrev-ref HEAD`"
alias gerpush="git push origin `git rev-parse --abbrev-ref HEAD`:refs/for/`git rev-parse --abbrev-ref HEAD` --no-thin"
alias gerpushprod="git push origin `git rev-parse --abbrev-ref HEAD`:refs/for/production --no-thin"
alias jump="ssh -A jump1.sto.spotify.net"
alias devadmin="ssh -A lon2-devadmin-a1"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="prose"
export DISABLE_AUTO_UPDATE="true"
plugins=(command-coloring git)

source $ZSH/oh-my-zsh.sh

alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir

#ccache ftw
CC=/usr/bin/ccache

# Stygg hack for å sette Maildir
# export MAIL="~/Maildir"
export MAIL="~/Mail"

autoload -U url-quote-magic
zle -N self-insert url-quote-magic

bindkey -e      # Emacs-style commandline editing

export LANG=en_DK.UTF-8

alias ls='ls --color=auto -F'
alias ll='ls -CA'
alias la='ls -a'
alias l='ls -lha'

alias ssh='ssh'

# Nice prompt
PROMPT=$'%j %{\e[0;32m%}%n%{\e[1;37m%}@%{\e[0;33m%}%m%{\e[m%}:%{\e[1;34m%}%30<..<%~%{\e[m%}%(!.#.$) '
#PROMPT=$'%j %{\e[1;30m%}%n%{\e[0;37m%}@%{\e[1;34m%}%m%{\e[m%}:%{\e[1;33m%}%30<..<%~%{\e[m%}%(!.#.>) '

PATH=/usr/lib/ccache:$PATH:/sbin:/usr/sbin:$HOME/bin
export FPATH=$FPATH:~/.zsh_completion

zstyle ':completion:*' completer _list _expand _complete _ignored _match _prefix
zstyle ':completion:*' condition 'NUMERIC != 1'
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' 'm:{a-z}={A-Z} l:|=* r:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/root/.zshrc'

if [ -f ~/.ssh/known_hosts ]; then
    hosts=(`awk -F "[, ]" '{print $1}' ~/.ssh/known_hosts`)
fi
if [ -f ~/.ssh/known_hosts2 ]; then
    hosts=($hosts `aw k -F "[, ]" '{print $1}' ~/.ssh/known_hosts2`)
fi
if [ -f ~/.ssh/config ]; then
    hosts=($hosts `grep ^Host ~/.ssh/config | sed s/Host\ // | egrep -v '^\*$'`)
fi


autoload -U compinit
compinit
# End of lines added by compinstall

#export LC_CTYPE="no_NO.ISO8859-1"
#export __GL_SYNC_TO_VBLANK=1
export LESS=-MM
export TZ='Europe/Oslo'
export CVS_RSH='ssh'
export RSYNC_RSH='ssh'
#export NNTPSERVER='news.scene.org'
export EDITOR=vim

export HISTSIZE=90000
export HISTFILE=~/.zsh_history
export SAVEHIST=90000
export HIST_EXPIRE_DUPS_FIRST=1
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY


busstuc () {
   echo "http://www.idi.ntnu.no/~tagore/cgi-bin/busstuc/busq.cgi?lang=nor&quest=$@" | \
   xargs -0 wget -q -O - | \
   html2text -width 1000| \
   sed '/[[:alpha:]]/p;d'
}

#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Colourize STDERR
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

case $TERM in
    *xterm*)
        precmd () {print -Pn "\e]0;%n@%M: %~\a"}
        ;;
esac

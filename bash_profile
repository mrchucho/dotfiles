source ~/.git-completion.bash
parse_git_branch() {
  git branch --color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias ls='ls -pahG'
alias ll='ls -lpahG'
alias ri='ri -T -fansi'
alias irb='irb --readline -r irb/completion'

export TERM=xterm-color
export MANPATH=$MANPATH:/usr/local/man

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export IRCNICK=MrChucho
export IRCUSER=MrChucho
export IRCNAME=MrChucho
export IRCSERVER=mrchucho.net

export EDITOR=vi

export HISTIGNORE="&:ls:[bf]g:exit"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"' # borrowed from RHEL


if [ -f $HOME/.inputrc ]; then
export INPUTRC=$HOME/.inputrc
fi

# ack configuration (see: man ack)
export ACK_COLOR_FILENAME="bold cyan"
export ACK_COLOR_MATCH="white on_blue"

# http://mipsisrisc.com/lscolors/
export LSCOLORS="gxfxcxdxbxegedabagacad" # "gxBxhxDxfxhxhxhxhxcxcx"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/


# VMWare
if [ -d /Library/Application\ Support/VMware\ Fusion/ ]; then
  export PATH=$PATH:/Library/Application\ Support/VMware\ Fusion
fi

# Git for Mac
if [ -d /usr/local/git ]; then
  export PATH=$PATH:/usr/local/git/bin
fi

# Postgres
if [ -d /usr/local/pgsql ]; then
  export PATH=$PATH:/usr/local/pgsql/bin
  export MANPATH=$MANPATH:/usr/local/pgsql/share/man
fi

# ======== Customization ========

# TODO combine .s3 and .ec2 under .aws/{ec2,s3}
if [ -f $HOME/.s3conf/s3config.sh ]; then
    . $HOME/.s3conf/s3config.sh
fi
if [ -f $HOME/.ec2/ec2.profile ]; then
    . $HOME/.ec2/ec2.profile
fi

if [ -f $HOME/.ps1 ] ; then
  . $HOME/.ps1
fi

# =========== rbenv =============

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

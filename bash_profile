parse_git_branch() {
  git branch --color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias ls='ls -pG'
alias ll='ls -lpG'
alias ri='ri -T -fansi'
alias irb='irb --readline -r irb/completion'
alias autospec='RUBYLIB=./lib RUBYOPT=-rubygems AUTOFEATURE=true autospec'

export TERM=xterm-color
export MANPATH=$MANPATH:/usr/local/man

export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:/usr/local/pgsql/bin

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
export LSCOLORS="gxfxcxdxbxegedabagacad"

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

# MacPorts Installer addition on 2009-09-25_at_12:30:24: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Go
export GOROOT=$HOME/Projects/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN

# VMWare
if [ -d /Library/Application\ Support/VMware\ Fusion/ ]; then
  export PATH=$PATH:/Library/Application\ Support/VMware\ Fusion/
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

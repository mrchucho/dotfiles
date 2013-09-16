export GIT_PS1_SHOWDIRTYSTATE=1
source ~/.git-completion.bash
parse_git_branch() {
  git branch --color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HISTIGNORE="&:ls:[bf]g:exit"
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"' # borrowed from RHEL

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

. $HOME/.profile

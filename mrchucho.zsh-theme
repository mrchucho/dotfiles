# Print the color codes.
# for color in {0..255}; do                                                                                                                                                                                     09:17:23 2013-06-13
# print -nP "%{\e[38;5;${color}m%}$color%{\e[0m%}\t"
# done
#
# http://en.wikipedia.org/wiki/Eigengrau

PROMPT=$'%{$fg[yellow]%}%m %{$reset_color%}%{$fg_bold[white]%}[%~]%{$reset_color%} $(git_prompt_info) $(/Users/rchurchill/Projects/platform-infrastructure/bin/sandbox ps1)\
%{$fg[blue]%}»%{$reset_color%} '
#RPROMPT=$'%{$FG[235]%}%D{%Y-%m-%d %H:%M:%S}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

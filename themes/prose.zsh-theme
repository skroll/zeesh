## Stolen from oh-my-zsh and modified.

## Set up ls colors that fit the theme.
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS="di=01;36:ln=00;35:so=00;32:pi=00;33:ex=00;31:bd=00;34;46:cd=00;34;43:su=07;31;40:sg=07;36;40:tw=07;32;40:ow=07;33;40"

## Helper functions for the prompt
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

## git prompt theming
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

## hg prompt theming
ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_UNTRACKED="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

## Get return status from last command and show in the prompt
local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

## Configure the prompt
PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(vcs_prompt_info)
$(virtualenv_info)$ '

RPROMPT='${return_status}%{$reset_color%}'

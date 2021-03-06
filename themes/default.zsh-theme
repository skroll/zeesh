## Theme specific ls colors
export LSCOLORS="exgxgxfxcxdAfAaCeCacAE"
export LS_COLORS="di=34:ln=36:so=36:pi=35:ex=32"

## Customize git prompt output.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

## Customize mercurial prompt output, but just use the same as the git
## settings.
ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_UNTRACKED="$ZSH_THEME_GIT_PROMPT_UNTRACKED"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

PROMPT='%{$reset_color%}%n %{$fg[blue]%}$(_prompt_pwd_compact)%{$reset_color%}$(vcs_prompt_info)%{$reset_color%}: '

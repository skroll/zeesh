export LSCOLORS="exgxgxfxcxdAfAaCeCacAE"
export LS_COLORS="di=34:ln=36:so=36:pi=35:ex=32"

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$reset_color%}%n %{$fg[blue]%}$(_prompt_pwd_compact)%{$reset_color%}$(git_prompt_info)%{$reset_color%}: '

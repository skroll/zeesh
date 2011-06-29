HISTFILE="$ZSH/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_allow_clobber
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

autoload -U down-line-or-beginning-search \
            up-line-or-beginning-search

zle -N down-line-or-history down-line-or-beginning-search
zle -N up-line-or-history up-line-or-beginning-search


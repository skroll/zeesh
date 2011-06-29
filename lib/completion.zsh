zmodload -i zsh/complist

## Case-insensitive (all), partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
	zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	unset CASE_SENSITIVE
else
	zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
fi

## Use the cache for completions that support it.
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $zsh_cache

zstyle ':completion:*' verbose yes
zstyle ':completion:*' squeeze-slashes true

## Only autocomplete directories for cd in the current path
zstyle ':completion:*:cd:*' tag-order local-directories

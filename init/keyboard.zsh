autoload -U zkbd
[[ ! -d "$ZSH/.zkbd" ]] && mkdir -p "$ZSH/.zkbd"
[[ ! -f "$ZSH/.zkbd/$TERM-$VENDOR-$OSTYPE" ]] && zkbd
unfunction zkbd

source "$ZSH/.zkbd/$TERM-$VENDOR-$OSTYPE"

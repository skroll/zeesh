autoload -U zkbd

## Create the .zkbd directory
[[ ! -d "$ZSH/.zkbd" ]] && mkdir -p "$ZSH/.zkbd"

## If a keyboard definition doesn't exist yet, run zkbd
## to create it
[[ ! -f "$ZSH/.zkbd/$TERM-$VENDOR-$OSTYPE" ]] && zkbd

## Prevent the function from being used outside initialization
unfunction zkbd

## Load the keyboard definition
source "$ZSH/.zkbd/$TERM-$VENDOR-$OSTYPE"

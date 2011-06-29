
## Automatic quoting of URLs
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## Disable flow control so ^S and ^Q are usable
unsetopt flowcontrol

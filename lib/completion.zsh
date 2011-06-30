zmodload -i zsh/complist

## Case-insensitive (all), partial-word and then substring completion
if [ "x$ZEESH_CASE_SENSITIVE" = "xtrue" ]; then
	zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	unset ZEESH_CASE_SENSITIVE
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

## Don't complete uninterestng users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
        dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
        hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
        mailman mailnull mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
        operator pcap postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs

## ... unless we really want to
zstyle '*' single-ignored show

## Enable menu completion

## Do not automatically select the first completion entry
unsetopt menu_complete

## Show completion menu on successive 
setopt auto_menu

## Enable menu select on all completions
zstyle ':completion:*:*:*:*:*' menu select

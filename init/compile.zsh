## Load functions for compiling scripts.
autoload -U compinit zrecompile

zsh_cache_host=$zsh_cache/zcomp-$HOST

## Create the cache directory if it doesn't exist.
mkdir -p $zsh_cache

## Make sure wildcards don't break the script if there are no files in
## a directory.
setopt nullglob

## List of files to compile
compile_list=($ZSH/zeesh.zsh
              $zsh_cache_host
              $ZSH/init/*.zsh
              $ZSH/lib/*.zsh
              $ZSH/functions/*
              $ZSH/internal_functions/*
              $ZSH/custom/lib/*
              $ZSH/custom/functions/*)

## Set this back to the default value
unsetopt nullglob

## Append to the list all activated plugins.
for plugin ($plugins); do
	if [ -f $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh ]; then
		compile_list=($compile_list $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh)
	elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
		compile_list=($compile_list $ZSH/plugins/$plugin/$plugin.plugin.zsh)
	fi
done

## Enable completion, but only dump to a cache file and compile only if the
## user is not root.
if [ $UID -eq 0 ]; then
	compinit
else
	compinit -d $zsh_cache_host

	## Compile scripts.
	for f in $compile_list; do
		zrecompile -p $f && rm -f $f.zwc.old
	done
fi

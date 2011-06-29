setopt nullglob

zeesh_custom_libs=($ZSH/custom/lib/*.zsh)
zeesh_custom_funcs=($ZSH/custom/functions/*~*.zwc)

unsetopt nullglob

## Load custom libs
for lib ($zeesh_custom_libs) source $lib
unset zeesh_custom_libs

## Load custom plugins
for plugin ($plugins); do
	if [ -f $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh ]; then
		source $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh
	fi
done

## Load custom functions
for func ($zeesh_custom_funcs) autoload -U $func:t
unset zeesh_custom_funcs

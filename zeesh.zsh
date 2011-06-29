#########################################################################
#                       Global Variables                                #
#########################################################################

## Where the cache is stored
zsh_cache="$ZSH/.cache"

#########################################################################
#                         Function Path                                 #
#########################################################################

## Add plugins to function path
plugin=${plugin:=()}
for plugin ($plugins) fpath=($ZSH/plugins/$plugin $fpath)

## Add functions directory to function path
fpath=($ZSH/functions $ZSH/internal_functions $fpath)

## Add custom functions to function path
[[ -d $ZSH/custom/functions ]] && fpath=($ZSH/custom/functions $fpath)

#########################################################################
#                         Initialization                                #
#########################################################################

## Some settings that should be available all time time
setopt extended_glob

## Compile functions and plugins
source $ZSH/init/compile.zsh

## Setup keyboard for key-bindings
source $ZSH/init/keyboard.zsh

## Load all files in the lib directory
for config_file ($ZSH/lib/*.zsh) source $config_file

## Load all plugins.
for plugin ($plugins); do
	## Don't load custom plugins yet, just make sure
	## an overridden plugin doesn't get loaded.
	if [ -f $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh ]; then
	elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
		source $ZSH/plugins/$plugin/$plugin.plugin.zsh
	fi
done

## Load custom libs/functions/plugins.
source $ZSH/init/custom.zsh

## Load the theme.
source $ZSH/init/theme.zsh


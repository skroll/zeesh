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

## Load all plugins, preferring custom ones, if available.
for plugin ($plugins); do
	if [ -f $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh ]; then
		source $ZSH/custom/plugins/$plugin/$plugin.plugin.zsh
	elif [ -f $ZSH/plugins/$plugin/$plugin.plugin.zsh ]; then
		source $ZSH/plugins/$plugin/$plugin.plugin.zsh
	fi
done

## Load all custom libs
for config_file ($ZSH/custom/*.zsh) source $config_file

## Load the theme
source $ZSH/init/theme.zsh


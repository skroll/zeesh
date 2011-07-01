## Some defaults that can be overridden by the user.

## Where to save the history file.
if [[ -z "$ZEESH_HISTFILE" ]]; then
	export ZEESH_HISTFILE="$ZSH/.zsh_history"
fi

## Maximum number of events in the internal history list.
if [[ -z "$ZEESH_HISTSIZE" ]]; then
	export ZEESH_HISTSIZE=10000
fi

## Maximum number of events that will be saved in the history file.
if [[ -z "$ZEESH_SAVEHIST" ]]; then
	export ZEESH_SAVEHIST=10000
fi

## Set the values for zsh to use.
HISTFILE="$ZEESH_HISTFILE"
HISTSIZE=$ZEESH_HISTSIZE
SAVEHIST=$ZEESH_SAVEHIST

## Save each command's beginning timestamp.
setopt extended_history

## Add '|' to output redirects in history.
setopt hist_allow_clobber

## If the internal history needs to be trimmed to add the current command
## line, the oldest history event that has a duplicate will be removed.
setopt hist_expire_dups_first

## If a new command line being added to the history list duplicates an older
## one, the older command is removed from the list.
setopt hist_ignore_all_dups

## Do not enter a command line into the history list if it duplicates the
## previous entry.
setopt hist_ignore_dups

## Do not save commands that have a leading space into the history.
setopt hist_ignore_space

## Remove superfluous blanks from each command line being added to the
## history list.
setopt hist_reduce_blanks

## Whenever the user enters a line with history expansion, don't execute
## the line directly; instead, perform history expansion and reload the
## line into the editing buffer.
setopt hist_verify

## Imports new commands from the history file and causes new commands to
## be written to the history file. Essentially this allows your history
## to be shared accross multiple sessions.
setopt share_history

## Allow for better multiline history search.
autoload -U down-line-or-beginning-search \
            up-line-or-beginning-search

zle -N down-line-or-history down-line-or-beginning-search
zle -N up-line-or-history up-line-or-beginning-search


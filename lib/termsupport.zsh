typeset -ga preexec_functions
typeset -ga precmd_functions

function zeesh_window_title {
	[ "$ZEESH_DISABLE_WINDOW_TITLE" != "true" ] || return

	if [[ "$TERM" == screen* ]]; then
		## Set screen hardstatus (around 20 characters).
		print -Pn "\ek$1:q\e\\" 
	elif [[ "$TERM" == xterm* ]] || \
	     [[ "$TERM" == rxvt* ]] || \
	     [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
		## Set window name.
		print -Pn "\e]2;$2:q\a"
		## Set tab name.
		print -Pn "\e]1;$1:q\a"
	fi
}

## 15 char left truncated path.
ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<"
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

function zeesh_window_title_precmd {
	zeesh_window_title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

function zeesh_window_title_preexec {
	emulate -L zsh
	setopt extended_glob

	## Get the command name only (strip sudo or ssh).
	local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]}
	zeesh_window_title "$CMD" "%100>...>$2%<<"
}

## Add the functions to precmd and preexec
precmd_functions+=zeesh_window_title_precmd
preexec_functions+=zeesh_window_title_preexec

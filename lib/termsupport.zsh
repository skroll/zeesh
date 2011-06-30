typeset -ga preexec_functions
typeset -ga precmd_functions

function zeesh_window_title {
	[ "$ZEESH_DISABLE_WINDOW_TITLE" != "true" ] || return

	if [[ "$TERM" == screen* ]]; then
		print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
	elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
		print -Pn "\e]2;$2:q\a" #set window name
		print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
	fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

function zeesh_window_title_precmd {
	zeesh_window_title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

function zeesh_window_title_preexec {
	emulate -L zsh
	setopt extended_glob
	local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
	zeesh_window_title "$CMD" "%100>...>$2%<<"
}

precmd_functions+=zeesh_window_title_precmd
preexec_functions+=zeesh_window_title_preexec

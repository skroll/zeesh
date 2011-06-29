case $TERM in
	xterm*|rxvt*)
		precmd () { print -Pn "\e]0;%n@%M: $(_prompt_pwd_compact)\a" }
		;;
	*)
		;;
esac

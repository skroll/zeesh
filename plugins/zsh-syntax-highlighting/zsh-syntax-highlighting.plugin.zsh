if [ "x$ZEESH_HIGHLIGHT_HIGHLIGHTERS" = "x" ]
then
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
else
	ZSH_HIGHLIGHT_HIGHLIGHTERS=(${(s: :)ZEESH_HIGHLIGHT_HIGHLIGHTERS})
fi

source $ZSH/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


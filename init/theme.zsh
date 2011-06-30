## Ensure the theme exists
if [[ ! -f $ZSH/themes/$ZSH_THEME.zsh-theme ]]; then
	export ZSH_THEME="default"
fi

## Load the theme
source "$ZSH/themes/$ZSH_THEME.zsh-theme"

## If the theme provides LS_COLORS, then set list-colors
## for completion to use it.
if [ "$ZEESH_DISABLE_LS_COLORS" != "true" ]; then
	if [ -n "$LS_COLORS" ]; then
		zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
	fi
fi

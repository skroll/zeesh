## Check if the theme is a directory
if [[ -d $ZSH/themes/$ZSH_THEME ]]; then
	ZSH_THEME_DIR="$ZSH/themes/$ZSH_THEME"
	ZSH_THEME_FILE="$ZSH_THEME_DIR/zsh-theme"
else
	ZSH_THEME_FILE="$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

if [[ ! -f $ZSH_THEME_FILE ]]; then
	export ZSH_THEME="default"
	ZSH_THEME_FILE="$ZSH/themes/$ZSH_THEME.zsh-theme"
fi

## Load the theme
source "$ZSH_THEME_FILE"

## If the theme provides LS_COLORS, then set list-colors
## for completion to use it.
if [ "$ZEESH_DISABLE_LS_COLORS" != "true" ]; then
	if [ -n "$LS_COLORS" ]; then
		zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
	fi
fi

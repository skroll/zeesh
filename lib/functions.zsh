## Load functions that should be publicly available to the user.
for func ($ZSH/functions/*~*.zwc) autoload -U $func:t

## Load custom functinos that should be publicly available to the user.
if [ -d $ZSH/custom/functions ];
then
	setopt nullglob
	for func ($ZSH/custom/functions/*~*.zwc) autoload -U $func:t
	unsetopt nullglob
fi

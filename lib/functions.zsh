## Load functions that should be publicly available to the user.
if [ -d $ZSH/functions ];
then
	setopt nullglob
	for func ($ZSH/functions/*~*.zwc) autoload -U $func:t
	unsetopt nullglob
fi

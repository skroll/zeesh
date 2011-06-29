## Load functions that should be publicly available to the user.
for func ($ZSH/functions/*~*.zwc) autoload -U $func:t

if [ -d $ZSH/custom/functions ];
then
	setopt nullglob
	for func ($ZSH/custom/functions/*~*.zwc) autoload -U $func:t
	unsetopt nullglob
fi

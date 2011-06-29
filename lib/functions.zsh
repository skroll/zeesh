## Load functions that should be publicly available to the user.
setopt nullglob
zeesh_functions=($ZSH/functions/*~*.zwc)
unsetopt nullglob

for func ($zeesh_functions) autoload -U $func:t

unset zeesh_functions

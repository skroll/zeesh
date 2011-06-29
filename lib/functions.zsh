## Load functions that should be publicly available to the user.
for func ($ZSH/functions/*~*.zwc) autoload -U $func:t

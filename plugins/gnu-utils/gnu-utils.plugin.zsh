# Check to see if the user is disabling LS_COLORS
if [ "$ZEESH_DISABLE_LS_COLORS" != "true" ]
then
	gnu_ls_options='--color=tty'
	bsd_ls_options='-G'
else
	gnu_ls_options=''
	bsd_ls_options=''
fi

# Check ls version
if [[ $(ls --version 2> /dev/null) == ((*GNU*)|(*fileutils*)|(*coreutils*)) ]] ; then
	alias ls="ls ${gnu_ls_options}"
elif [[ -x $(whence gls) ]] && [[ $(gls --version) == ((*GNU*)|(*fileutils*)|(*coreutils*)) ]] ; then
	alias ls="gls ${gnu_ls_options}"
else
	alias ls="ls ${bsd_ls_options}"
fi

# On OS X zcat's version outputs GNU, no way to differentiate it
# from vanilla GNU utils, so just check for gzcat
if [[ -n $(command -v gzcat) ]]; then
	alias zcat="gzcat"
fi


## Various helper functions used by prompts and themes.

## Helper function to display the current path in a prompt.
## Will cut directory names to only the first letter if the
## path is deeper than $HOME or /.
_prompt_pwd_compact()
{
	case $PWD in
		$HOME)
			echo -n '~'
			;;
		*)
			local p=$(echo -n "${PWD/$HOME/~}" | sed -e 's-/\([^/]\)\([^/]*\)-/\1-g')
			echo -n "$p${${PWD/#*\/}[2,-1]}"
			;;
	esac
}

## Helper function to display the current path in a prompt.
## Expands from $HOME or /, and displays the full path.
_prompt_pwd()
{
	case $PWD in
		$HOME)
			echo -n '~'
			;;
		*)
			local p=$(echo -n "${PWD/$HOME/~}")
			echo -n "$p"
			;;
	esac
}

# Allows ssh-agent env vars to get properly set when reattaching a
# session in tmux.
function zsh_ssh_preexec {
	if [[ -n $TMUX ]]; then
		NEW_SSH_AUTH_SOCK=`tmux showenv|grep SSH_AUTH_SOCK|cut -d = -f 2`
		if [[ -n $NEW_SSH_AUTH_SOCK ]] && [[ -S $NEW_SSH_AUTH_SOCK ]]; then
			SSH_AUTH_SOCK=$NEW_SSH_AUTH_SOCK
		fi
	fi
}

preexec_functions+='zsh_ssh_preexec'

## Unified version control system prompt information
function vcs_prompt_info() {
	echo "$(git_prompt_info)$(hg_prompt_info)"
}

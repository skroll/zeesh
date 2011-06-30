## Unified version control system prompt information
function vcs_prompt_info() {
	## Try git first, then mercurial
	ref=$(git_prompt_info) || ref=$(hg_prompt_info) || ref=""
	echo "${ref}"
}

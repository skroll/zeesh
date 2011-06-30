## Unified version control system prompt information
function vcs_prompt_info() {
	## Try git first, then mercurial
	vcsprompt=""

	[[ "$ZEESH_DISABLE_GIT" != "true" ]] \
		&& [[ -z "$vcsprompt" ]] \
		&& vcsprompt=$(git_prompt_info)

	[[ "$ZEESH_DISABLE_HG" != "true" ]] \
		&& [[ -z "$vcsprompt" ]] \
		&& vcsprompt=$(hg_prompt_info)

	echo "$vcsprompt"
}

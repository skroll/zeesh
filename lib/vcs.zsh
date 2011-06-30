## Unified version control system prompt information
function vcs_prompt_info() {
	## Try git first, then mercurial
	vcsprompt=""

	[[ "$DISABLE_ZEESH_GIT" != "true" ]] \
		&& [[ -z "$vcsprompt" ]] \
		&& vcsprompt=$(git_prompt_info)

	[[ "$DISABLE_ZEESH_HG" != "true" ]] \
		&& [[ -z "$vcsprompt" ]] \
		&& vcsprompt=$(hg_prompt_info)

	echo "$vcsprompt"
}

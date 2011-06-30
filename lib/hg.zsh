## Some standard hg functions for use in prompts.

## Get the name of the branch we are on.
function hg_prompt_info() {
	branch=$(hg branch 2> /dev/null) || return
	echo "$ZSH_THEME_HG_PROMPT_PREFIX${branch}$(parse_hg_dirty)$ZSH_THEME_HG_PROMPT_SUFFIX"
}

## Checks the status of the hg repository.
parse_hg_dirty() {
	hgstat=$(hg status 2> /dev/null)
	hg_dirty_pattern="^\(A\|!\|M\)"
	hg_untracked_pattern="^\(?\)"

	[[ $(echo ${hgstat} | grep -c "${hg_dirty_pattern}") > 0 ]] \
		&& echo -n "$ZSH_THEME_HG_PROMPT_DIRTY"

	[[ $(echo ${hgstat} | grep -c "${hg_untracked_pattern}") > 0 ]] \
		&& echo -n "$ZSH_THEME_HG_PROMPT_UNTRACKED"

	[[ -z $(echo ${hgstat}) ]] \
		&& echo -n "$ZSH_THEME_HG_PROMPT_CLEAN"
}

## Will return the current branch name.
function hg_current_branch() {
	branch=$(hg branch 2> /dev/null) || return
	echo ${branch}
}


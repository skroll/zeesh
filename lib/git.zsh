## Some standard git functions for use in prompts.

## Get the name of the branch we are on.
function git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

## Checks the status of the git repository.
parse_git_dirty() {
	gitstat=$(git status --porcelain 2> /dev/null)
	git_untracked_pattern="^\(??\| M\)"
	git_dirty_pattern="^\(M \)"

	[[ $(echo ${gitstat} | grep -c "${git_dirty_pattern}") > 0 ]] \
		&& echo -n "$ZSH_THEME_GIT_PROMPT_DIRTY"

	[[ $(echo ${gitstat} | grep -c "${git_untracked_pattern}") > 0 ]] \
		&& echo -n "$ZSH_THEME_GIT_PROMPT_UNTRACKED"

	[[ -z $(echo ${gitstat}) ]] \
		&& echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
}

## Checks if there are commits ahead from remote.
function git_prompt_ahead() {
	if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
		echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
	fi
}

## Will return the current branch name.
## Usage example: git pull origin $(current_branch)
function current_branch() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo ${ref#refs/heads/}
}

## Formats prompt string for current git commit short SHA.
function git_prompt_short_sha() {
	SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

## Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
	SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

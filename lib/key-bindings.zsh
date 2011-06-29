## Use emacs style key-bindings.
bindkey -e

## ^r does an incremental history search.
bindkey "^r" history-incremental-search-backward

## Expand history on space
bindkey " " magic-space

## These should be set if zkbd was run.
[[ -n "${key[Backspace]}" ]]     && bindkey "${key[Backspace]}" backward-delete-char
[[ -n "${key[Home]}" ]]          && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[Delete]}" ]]        && bindkey "${key[Delete]}" delete-char
[[ -n "${key[End]}" ]]           && bindkey "${key[End]}" end-of-line
[[ -n "${key[Up]}" ]]            && bindkey "${key[Up]}" up-line-or-history \
                                 && bindkey "\e${key[Up]}" up-line-or-history
[[ -n "${key[Left]}" ]]          && bindkey "${key[Left]}" backward-char \
                                 && bindkey "\e${key[Left]}" backward-word
[[ -n "${key[Down]}" ]]          && bindkey "${key[Down]}" down-line-or-history \
                                 && bindkey "\e${key[Down]}" down-line-or-history
[[ -n "${key[Right]}" ]]         && bindkey "${key[Right]}" forward-char \
                                 && bindkey "\e${key[Right]}" forward-word
[[ -n "${key[Control-Left]}" ]]  && bindkey "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey "${key[Control-Right]}" forward-word

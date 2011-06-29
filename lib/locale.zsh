## If a default language is not set, then use en_US.UTF-8
if [[ -z "$DEFAULT_LANG" ]] then
	export LANG="en_US.UTF-8"
else
	export LANG="$DEFAULT_LANG"
fi

## Append UTF-8 if it is not already
if [[ "$LANG" != "*.UTF-8" ]] then
	export LANG="${LANG%.*}.UTF-8"
fi

## Verify that the locale command exists
if [[ -n "$(command -v locale)" ]]
then
	# Append UTF-8 if it is not already
	if [[ "$LANG" != "*.UTF-8" ]] then
		export LANG="${LANG%.*}.UTF-8"
	fi

	## See if the UTF-8 version of the locale is available, if not, then don't
	## use it.
	locale -a 2> /dev/null | grep -iq "^${LANG/-/-\?}\$" || \
		export LANG="${LANG%.*}"

	## See if the locale exists in non UTF-8 form, if not, set it to C.
	locale -a 2> /dev/null | grep -iq "^${LANG/-/-\?}\$" || \
		export LANG=C
fi

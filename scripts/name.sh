#!/usr/bin/env bash

function is_integer
{
    if [[ "$1" =~ ^(0|[1-9][0-9]*)$ ]]; then
        return 0
    else
        return 1
    fi
}

use_lhs=false
use_rhs=false
sep='-'

while [ $# -gt 1 ]; do
    case "$1" in
        -l) use_lhs=true ;;
        -r) use_rhs=true ;;
        -s)
            sep="$2"
            shift
            ;;
    esac
    shift
done

($use_lhs && $use_rhs) && use_sep=true || use_sep=false

# The session name should be passed in as a positional argument to this script.
name="$1"

WORDS="$(realpath "$(dirname "${BASH_SOURCE[0]}")/../")/words"

# If the name was assigned by Tmux, change it to a random one.
if is_integer "$name"; then
    name=''
    if $use_lhs; then
        readarray -t lhs_array < "$WORDS/lhs.txt"
        name+="${lhs_array[$(($RANDOM % ${#lhs_array[@]}))]}"
    fi
    if $use_sep; then
        name+="$sep"
    fi
    if $use_rhs; then
        readarray -t rhs_array < "$WORDS/rhs.txt"
        name+="${rhs_array[$(($RANDOM % ${#rhs_array[@]}))]}"
    fi
    tmux rename "$name"
fi

#!/usr/bin/env bash

NAME_GENERATOR="$(dirname "${BASH_SOURCE[0]}")/scripts/name.sh"

use_lhs=$(tmux show -gqv '@name_generator_use_lhs')
use_rhs=$(tmux show -gqv '@name_generator_use_rhs')
sep=$(tmux show -gqv '@name_generator_sep')

opts=''

[[ "$use_lhs" =~ ^(|1|on|yes|true)$ ]] && opts+='-l '
[[ "$use_rhs" =~ ^(|1|on|yes|true)$ ]] && opts+='-r '
[[ "$sep" != '' ]] && opts+="-s '$sep' "

tmux set -ag session-created "run \"'$NAME_GENERATOR' $opts '#{hook_session_name}'\""

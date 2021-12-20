#! /bin/bash

# region - Intro block------------------------------------------------
#
# ## Objective
#
# The objective of this script is to illustrate how to use the `log.sh`
# helper. Just include the file in your script and add here and there some
# `log::write` calls like you can see in the `add()` function to get advantage
# of the logging features.
# 
# ## How to use this script?
#
# Run this script `clear ; ./use_log.sh`. You'll just see *The result is 10*
# and nothing else.
#
# Also try to run this script like below to see differences:
#
# * `clear ; ./use_log.sh --verbose`
# * `clear ; ./use_log.sh --verbose --immediate-log`
# * `clear ; ./use_log.sh --verbose --show-log-exit`
#
# endregion ----------------------------------------------------------

# let script exit if an unsed variable is used or if a command fails
set -o nounset
set -o errexit

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

# shellcheck disable=SC1091
. "$SCRIPT_DIR"/../../log/log.sh

function add() {
    log::write "The add function has been called with $1 and $2" 
    result=$(($1+$2))
    log::write "The addition of $1 and $2 gives $result"
    echo $result
}

echo "The result is $(add 3 7)"

#! /bin/bash

# region - Intro block------------------------------------------------
#
# ## How to use this script?
#
# 1. Include the script in your own Bash like this `. log.sh` (adjust path if needed).
# 2. Here and there, where you want a log, just type `log "This is a log info"`
#
# You don't need to initialize things, just call the `log` function will be enough.
#
# ## Command line arguments
#
# * `-v` or `--verbose`: enable the logging, entries will be written to a temporary logfile.
# * `--immediate-log`  : the log entry will be displayed immediately on the console
# * `--show-on-exit`   : the logfile content will be displayed when the script will exit
#
# ## Dependency
#
# * `console.sh`
#
# ## Sample
#
# * See `./../samples/use_log.sh`
#
# endregion ----------------------------------------------------------

#! Requires console.sh
SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
. $SCRIPT_DIR/../console/console.sh

# region - Private functions -----------------------------------------
#! private function are prefixed by a double-underscore, don't use them
#! outside this script.

# region - Private function __binaryLogViewer()
#
# Try to detect the presence of batcat (https://github.com/sharkdp/bat),
# if not found, use the built-in cat viewer and return the binary filename
#
__binaryLogViewer() {
    local viewer="$(which batcat)"
    if [ -z $viewer ]; then
        printGray "Tip: install https://github.com/sharkdp/bat for an improved log display" >/dev/tty
        # batcat not installed
        viewer="$(which cat)"
    fi

    # Return the binary to use
    echo "$viewer"
}
# endregion

# region - Private function __displayLog()
#
# Display the content of the logfile
__displayLog() {
    # If the file is empty, nothing to do
    [ ! -s  "${__LOGFILE}" ] && return

    echo ""

    # cat or batcat binary
    $(__binaryLogViewer) "${__LOGFILE}"

    echo ""
}
# endregion

# region - Private function __removeLog()
__removeLog() {
    [ -f "$__LOGFILE" ] && rm --force "$__LOGFILE" &>/dev/null
}
# endregion

# region - Private function __logConstructor()
#
# Process command line arguments and set global variables accordingly
#
#! Should be called with $* (without quotes) to get access to the list
#! of CLI arguments
function __logConstructor() {
    __VERBOSE=false

    while [[ $# -gt 0 ]]; do
        case $1 in
            "-v" | "--verbose")
                __VERBOSE=true
                ;;
            "--immediate-log")
                # Log entries will be immediately displayed on the console
                __VERBOSE=true              # Should be enabled
                __SHOW_LOG_IMMEDIATE=true
                ;;
            # The content of the log file will be displayed when exiting the script
            "--show-log-exit")
                __VERBOSE=true              # Should be enabled
                __SHOW_LOG_ON_EXIT=true
                ;;
        esac
        shift # past argument
    done
}
# endregion

# region - Private function __logDestruct()
#
# Before exiting the script, display or not the logfile content (and remove it then)
function __logDestruct() {
    # Only if the file isn't empty
    if [ -s  "${__LOGFILE}" ]; then
        logEntry="$(printf '[%s] Logfile %s ended for %s.' "$(__logNow)" "$__LOGFILE" "$0")"
        echo "$logEntry" >> "$__LOGFILE"
        [ $__SHOW_LOG_IMMEDIATE = true ] && echo "$logEntry" > /dev/tty

        logEntry="$(printf '[%s] Duration: %d second(s)' "$(__logNow)" "$SECONDS")"
        echo "$logEntry" >> "$__LOGFILE"
        [ $__SHOW_LOG_IMMEDIATE = true ] && echo "$logEntry" > /dev/tty
    fi

    if [ $__SHOW_LOG_ON_EXIT = true ]; then
        __displayLog
        __removeLog
        return
    fi

    if [ -s  "${__LOGFILE}" ]; then
        printGray "Run \"$(__binaryLogViewer) $__LOGFILE\" if your" \
            "want to see the content of the logfile or use the" \
            "--show-log-exit command line argument"
    fi

}
# endregion

# endregion - Private functions --------------------------------------

# region - Public function log()
#
# Write a sentence to a logfile and, when __SHOW_LOG_IMMEDIATE=true 
# to the console too (see --immediate-log CLI argument)
#
# Example: log 'This is a log entry'
log() {
    [ $__VERBOSE = false ] && return

    # If the file isn't writable, error and return
    if [[ ! -w "$__LOGFILE" ]]; then
        printRed "Error the $__LOGFILE file isn't writable"
        return
    fi

    local logEntry

    # If the filesize is 0, echo a start info date/time; do it once
    if [[ ! -s "$__LOGFILE" ]]; then
        logEntry="$(printf '[%s] Logfile %s started for %s.' "$(__logNow)" "$__LOGFILE" "$0")"
        echo "$logEntry" >> "$__LOGFILE"
        [ $__SHOW_LOG_IMMEDIATE = true ] && echo "$logEntry" > /dev/tty
    fi

    # Echo the sentence to the existing logfile
    logEntry="$(printf '[%s] %s' "$(__logNow)" "$*")"
    echo "$logEntry" >> "$__LOGFILE"
    [ $__SHOW_LOG_IMMEDIATE = true ] && echo "$logEntry" > /dev/tty
}
# endregion

# region - Entry point -----------------------------------------------
# "trap ... EXIT" allow to define a function to call when the script exits,
# so, here, call our __logDestruct function
trap __logDestruct EXIT

# Define the log format if not yet specified earlier
[[ -z "$__LOGTFMT" ]] && __LOGTFMT='%Y-%m-%d %H:%M:%S'

# Define the log filename if not yet specified earler
# $(basename $0) will be used to retrieve the basename of the running
# script (like docker-up.sh)
#
# Example of a filename: /tmp/docker-up.sh.1J6Sczqb62.log
[[ -z "$__LOGFILE" ]] && __LOGFILE="$(mktemp /tmp/$(basename $0).XXXXXXXXXX.log)"

# Set the default value for the verbose mode Y/N
[[ -z "$__VERBOSE" ]] && __VERBOSE=false

# By default, when the script will exit, the content of the log file will be displayed
[[ -z "$__SHOW_LOG_ON_EXIT" ]] && __SHOW_LOG_ON_EXIT=false

# Should log entries be immediately displayed on the console (true) or just at the end (false)
[[ -z "$__SHOW_LOG_IMMEDIATE" ]] && __SHOW_LOG_IMMEDIATE=false

# Quick function to export the system date in the choosen format.
__logNow() { date +"$__LOGTFMT"; }

# Detect if the verbose mode has been enabled
__logConstructor $*
# endregion ----------------------------------------------------------

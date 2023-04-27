#! /bin/bash

# region - Intro block------------------------------------------------
#
# ## How to use this script?
#
# Just include this script in your own Bash like this `. console.sh`
#
# Now, you can use any public functions defined here like `console::printYellow`.
#
# Namespace
#
# `console::`
#
# ## Dependency
#
# None
#
# endregion ----------------------------------------------------------

# let script exit if an unsed variable is used or if a command fails
set -o nounset
set -o errexit

# region - Define colors
__GRAY=30
__RED=31
__GREEN=32
__YELLOW=33
__BLUE=34
__PURPLE=35
__CYAN=36
__WHITE=37
# endregion

# region - Public function console::printGray()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printGray() {
    for line in "$@"; do
        printf "\e[1;${__GRAY}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printGrayNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printGrayNoNewLine() {
    printf "\e[1;${__GRAY}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printRed()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printRed() {
    for line in "$@"; do
        printf "\e[1;${__RED}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printRedNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printRedNoNewLine() {
    printf "\e[1;${__RED}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printGreen()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printGreen() {
    for line in "$@"; do
        printf "\e[1;${__GREEN}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printGreenNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printGreenNoNewLine() {
    printf "\e[1;${__GREEN}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printYellow()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printYellow() {
    for line in "$@"; do
        printf "\e[1;${__YELLOW}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printYellowNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printYellowNoNewLine() {
    printf "\e[1;${__YELLOW}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printBlue()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printBlue() {
    for line in "$@"; do
        printf "\e[1;${__BLUE}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printBlueNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printBlueNoNewLine() {
    printf "\e[1;${__BLUE}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printPurple()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printPurple() {
    for line in "$@"; do
        printf "\e[1;${__PURPLE}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printPurpleNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printPurpleNoNewLine() {
    printf "\e[1;${__PURPLE}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printCyan()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printCyan() {
    for line in "$@"; do
        printf "\e[1;${__CYAN}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printCyanNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printCyanNoNewLine() {
    printf "\e[1;${__CYAN}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printWhite()
# $@ can be a multi-lines argument, each line will be echoed on the console
function console::printWhite() {
    for line in "$@"; do
        printf "\e[1;${__WHITE}m%s\e[m\n" "$line"
    done
}
# endregion

# region - Public function console::printWhiteNoNewLine()
# $@ can be a multi-lines argument, each line will be echoed on the console at once (one line, no carriage return)
function console::printWhiteNoNewLine() {
    printf "\e[1;${__WHITE}m%s\e[m\n" "$*"
}
# endregion

# region - Public function console::printStart()
#
# Display name of the running script and the start time
function console::printStart() {
    console::printWhiteNoNewLine "Running $(basename "$0") - " \
        "Start at $(date +'%d/%m/%y %H:%M:%S')" \
        ""
    echo ""
}
# endregion

# region - Public function console::printStop()
#
# Display name of the running script, the end time and elapsed time in seconds
function console::printStop() {
    console::printWhiteNoNewLine "Running $(basename "$0") - " \
        "End at $(date +'%d/%m/%y %H:%M:%S'), duration: $SECONDS seconds" \
        ""
    echo ""
}
# endregion

# region - Public function printItalic()
function console::printItalic() {
    echo -e "\e[3m$*\e[0m"
}
# endregion

# region - Public function printError()
#
# Make sure to write to STDERR
function console::printError() {
    for line in "$@"; do
        console::printRed "[$(date +'%Y-%m-%dT%H:%M:%S%z')] ERROR - $line"
    done
}
# endregion

# region - Public function banner()
#
# Just make sure the banner has a fixed length
function console::banner() {
    printf "\e[1;36m%s\e[m\n"  "============================================"
    printf "\e[1;36m= %-40s =\e[m\n" "$@"
    printf "\e[1;36m%s\e[m\n\n"  "============================================"
}
# endregion

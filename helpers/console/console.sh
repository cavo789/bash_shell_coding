#! /bin/bash

# region - Intro block------------------------------------------------
#
# ## How to use this script?
#
# Just include this script in your own Bash like this `. console.sh`
#
# Now, you can use any public functions defined here like `printYellow`.
#
# ## Dependency
#
# None
#
# endregion ----------------------------------------------------------

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

# region - Public function printGray()
function printGray() {
    printf "\033[0;${__GRAY}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printRed()
function printRed() {
    printf "\033[0;${__RED}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printGreen()
function printGreen() {
    printf "\033[0;${__GREEN}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printYellow()
function printYellow() {
    printf "\033[0;${__YELLOW}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printBlue()
function printBlue() {
    printf "\033[0;${__BLUE}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printPurple()
function printPurple() {
    printf "\033[0;${__PURPLE}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printCyan()
function printCyan() {
    printf "\033[0;${__CYAN}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printWhite()
function printWhite() {
    printf "\033[0;${__WHITE}m%s\033[0m\n" "$*"
}
# endregion

# region - Public function printItalic()
function printItalic() {
    echo -e "\e[3m$*\e[0m"
}
# endregion

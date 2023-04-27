# The console helper

> You can download the console helpers [here](console.sh)

## How to use this script?

Just include this script in your own Bash like this `. console.sh`

Now, you can use any public functions defined here like `console::printItalic`, `console::printYellow`, `console::printRed` or many others.

## Dependency

None

## Extra information

Using a format like below to write text in light green:

```bash
printf "\e[1;92m%s\e[m\n" "Success!"
```

Change the value of `31` (red) to a value between `30` and `37` (for dark) or between `90` and `96` (for light) to use another color (see [https://misc.flogisoft.com/bash/tip_colors_and_formatting#foreground_text](https://misc.flogisoft.com/bash/tip_colors_and_formatting#foreground_text) for more ANSI colors).

### Long string

The following example shows how to use an array to split a long string into smaller one and print it with one call:

```bash
text=(
    "Line 1 ..."
    "Line 2 ..."
    "Line 3 ..."
)

printf "%s\n" "${text[@]}"
```

Now, you can also use colors. The following line will display each line in red:

```bash
printf "\e[1;31m%s\e[m\n" "${text[@]}"
```

Real example, the following code will display an error message in red:

```bash
text=(
    "ArgumentCountError - Please call ${FUNCNAME[0]}() with one parameter:"
    "the name of the file to read"
    "For instance: ${FUNCNAME[0]} 'readme.txt'"
)

printf "\e[1;31m%s\e[m\n" "${text[@]}"
```

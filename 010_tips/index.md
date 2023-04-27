# Tips

## Linting

Run `/bin/bash -n script.sh` to lint it i.e. verify his syntax with running it. 

## Debugging

Run `/bin/bash -x script.sh` to debug it i.e. to see every commands executed by the shell interpretor

## Coding tips

### Options

Add these lines at the top of every scripts:

```bash
# let script exit if an unsed variable is used
set -o nounset

# let script exit if a command fails
set -o errexit
```

This will improve the quality of your script by forcing the developer to declare each variable before its first use and to ask the shell intrepretor to leave the script as soon as a command fails.

### Redirect to stderr

When you'll write an error make sure to always write to STDERR (i.e. `&2`), for instance:

```bash
echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ERROR - $*" >&2
```

This will allow to be able to separate normal output (STDOUT) and errors (STRERR).

Extra tip: use `${FUNCNAME[0]}` to get the name of the running function

```bash
echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: ERROR in function ${FUNCNAME[0]} - $*" >&2
```

### Use default values

Use the following syntax `${VERBOSE:-false}` to set a default value when the variable isn't set yet.

### Retrieve the folder of the running script

The running script is the one executed by the shell interpretor: use `$0`

```bash
SCRIPT_DIR=$(cd -- "$( dirname -- "$0" )" &> /dev/null && pwd)
```

### Retrieve the folder of the current script

The current script is the one making f.i. an include statement. For instance, the `./script.sh` includes `./bash/log.sh`. And `./bash/log.sh` wish to include the `console.sh` that is in the same folder i.e. `./bash/`. For this use, here is the snippet: use `${BASH_SOURCE[0]}`

```bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
```

### Use the function keyword

Declare your function with `function` like

```bash
function main() {
    // ...
}
```

### Prefer [[ ... ]] and ==

For clarity, use `==` for equality rather than `=` even though both work. The former encourages the use of `[[` and the latter can be confused with an assignment

### Add a namespace to your helpers

Prefer to use something like `console::printYellow()` and not just `printYellow()`. This allow the developer to know where the function is (logically in a file called `console.sh`) and this will reduce the risk of conflict (if you already have such function declared in your scripts).

### Read command line arguments and set them to readonly then

Once the variable has been initialized, prohibit to change his value using the `readonly` keyword.

```bash
VERBOSE='false'

while getopts 'v' flag; do
    case "${flag}" in
        v) VERBOSE='true' ;;
    esac
done

readonly VERBOSE
```

### Add a main function

In order to easily find the start of the program, put the main program in a function called main as the bottom most function. This provides consistency with the rest of the code base as well as allowing you to define more variables as local (which can’t be done if the main code is not a function). The last non-comment line in the file should be a call to main:

```bash
main "$@"
```

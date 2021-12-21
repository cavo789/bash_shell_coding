## How to use this script?

1. Include the script in your own Bash like this `. log.sh` (adjust path if needed).
2. Here and there, where you want a log, just type `log::write "This is a log info"`

## Command line arguments

* `-v` or `--verbose`: enable the logging, entries will be written to a temporary logfile.
* `--immediate-log`: the log entry will be displayed immediately on the console
* `--show-on-exit`: the logfile content will be displayed when the script will exit

## Dependency

* `console.sh`

## Sample

* See `./../samples/use_log.sh`

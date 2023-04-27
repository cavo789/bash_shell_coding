# Run bash from Windows 10

If you get trouble by running `bash` from a command prompt, specify the full path like this:

```bash
"C:\Program Files\Git\bin\bash.exe" yourscript.sh
```

It should works now.

## Add an alias

Don't want to specify each time the full path? Just create an alias.

Edit your system variables by running the `Edit system environment variables` program (i.e. click on the `Start` button then start to type `Edit system...`).

Click on the `Path` in the **system variable** area (see screen capture below).

![edit_path](./images/edit_path.png)

Add a new folder at the very first position. *I've chosen to create such folder: `C:\Christophe\Repository\aliases\` on my side.*

![add_to_path](./images/add_to_path.png)

**Note: make sure the alias folder is at the first position to have the priority to any other command having the same name.**

Go now to your aliases folder and add a new file called `bash.cmd` and edit the file. Type the following content:

```bash
@echo off
REM cls  -- Don't clear the screen, need to keep it for batch operations
REM And make sure to return the exit code
"C:\Program Files\Git\bin\bash.exe" %*

set errorcode=%ERRORLEVEL%

IF %errorcode% NEQ 0 (
    echo     [31mERROR - The bash script has returned an error %errorcode%[0m
    echo     [31mThe command line was:[0m
    echo.
    echo     [31m"C:\Program Files\Git\bin\bash.exe" %*[0m
    echo.
)

EXIT /B %errorcode
```

Since you've modified your `PATH` variable, close any command prompt screen and start a new one.

Now, by just typing `bash` it should works.

## Possible problems

By just running `bash` from the command prompt, you can get this error:

```text
Windows Subsystem for Linux has no installed distributions.
Distributions can be installed by visiting the Microsoft Store:
https://aka.ms/wslstore
```

Note: the default `bash` interpreter is located in the `C:\Windows\System32\` folder

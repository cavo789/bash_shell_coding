# Bash with git bash

If you want to use git bash, you must follow these steps:

* Download [Git for Windows](https://gitforwindows.org)
* Install it.
* Execute this command in your power shell console as an administrator:

```bash
$files = (Get-ChildItem 'C:\Program Files\Git\usr\bin\*.exe').FullName

$files.ForEach({Set-ProcessMitigation $_ -Disable ForceRelocateImages})
```

* Edit your system variables by running the `Edit system environment variables` program (i.e. click on the `Start` button then start to type `Edit system...`).
* Click on the `Path` in the **system variable** area (see screen capture below).
  
    ![edit_path](./images/edit_path.png)

* Move the git command folder before system32
* Execute git as an administrator

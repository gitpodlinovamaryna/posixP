"progC" with Installer


Project Description

This program prints the value of MY_VAR environment variable with specified option `-o file`.
If `-o file` option is specified, the value is printed to a file, otherwise to STDOUT.
If MY_VAR is not set, an error message is written to STDERR, and the program ends up with a code `123`. If internal errors occur (e.g., no write rights to a directory), the program terminates with a code `1`.

Installer is a self-sufficient sh-script. 

How to Install and Run the Project:

When you have donloaded the project:
 -- Open your terminal and go to directory with installer.sh script and archive.
 -- Run the script with option:

    if option = 1, then:
        "(./installer.sh) (option) (path to the archive)" program will be installed to the default directory;
        "(./installer.sh) (option) (path to the archive) (path to the install)" program will be installed to the (path to the install) directory.

    if option = 2, then:
        "(./installer.sh) (option) (path to the app for remove)" program will be removed from the (path to the app) directory;

    if option = 3, then:
         "(./installer.sh) (option) (path to the archive) (path to the install) (path to the app for remove)" program will be removed from the (path to the app for remove) and install to the (path to the install) directory;
    
    Examples:
        ./installer.sh 1 /Users/marynapodlinovaw/Documents/PosixShellAndUtilities/progC/installatorScripts/progC_2022-03-30-15-46-57.tar.gz
        ./installer.sh 2 /Users/marynapodlinovaw/Documents/PosixShellAndUtilities/progC/installatorScripts/progC
    
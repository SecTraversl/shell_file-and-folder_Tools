#!/bin/bash

############################################
# SYNOPSIS
# - The "rename-filesExample" function is an example of how we can rename multiple files at once.  This example takes each file in the current directory and prepends 'my_' to the current file name.
#
###########
# NOTES
# - Name:  rename-filesExample.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - This was helpful:  https://stackoverflow.com/questions/15151653/how-to-use-linux-shell-pipe-rename-file
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output of running the function ...

temp$ ls
Text-file-created-on-Linux-via-the-cli.txt  Text-file-created-on-Windows-by-notepad.txt
temp$ 
temp$ rename-filesExample 
temp$ ls
my_Text-file-created-on-Linux-via-the-cli.txt  my_Text-file-created-on-Windows-by-notepad.txt
#comment
############################################


function rename-filesExample () {
  find -maxdepth 1 -type f | awk '{printf "mv %s my_%s\n", $2, $2}' FS=/ | sh
}


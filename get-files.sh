#!/bin/bash

############################################
# SYNOPSIS
# - The "get-files" function returns any files that are in the current directory (by default).  If an argument is given which is a valid directory name, then the function returns the files in that directory. 
#
###########
# NOTES
# - Name:  get-files.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - This was helpful:  https://askubuntu.com/questions/811210/how-can-i-make-ls-only-display-files
#   - File-based "if" conditions such as '-d' for validating the arg is a directory:  https://acloudguru.com/blog/engineering/conditions-in-bash-scripting-if-statements
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when running the function ...

temp$ get-files
./Text-file-created-on-Windows-by-notepad.txt
./Text-file-created-on-Linux-via-the-cli.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output when we given the function a reference to the parent directory ...

temp$ get-files ..
../worksheet.txt
../notes_block-comments.txt
../notes_line-numbers-awk-and-more.txt
../notes_tutorial-on-bash-functions.txt
../notes_echo-with-newline-chars.txt
../notes_eval_getent_py_get-users.txt
#comment
############################################
 

function get-files () {
  if [ -d "$1" ]; then
    find "$1" -maxdepth 1 -not -type d
  else
    find . -maxdepth 1 -not -type d
  fi
}


#!/bin/bash

############################################
# SYNOPSIS
# - The "get-filesNameOnly" function returns any names of files that are in the current directory (by default).  If an argument is given which is a valid directory name, then the function returns the names of files in that directory.
#
###########
# NOTES
# - Name:  get-filesNameOnly.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - File-based "if" conditions such as '-d' for validating the arg is a directory:  https://acloudguru.com/blog/engineering/conditions-in-bash-scripting-if-statements

#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the default usage of the function without any args (which evaluates the current directory by default) ...

temp$ get-filesNameOnly 
Text-file-created-on-Linux-via-the-cli.txt
Text-file-created-on-Windows-by-notepad.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the function in use with an argument that is a reference to the parent directory ...

temp$ get-filesNameOnly ..
alias_funcs/
aws-cli_funcs/
bash_functions_import.sh
files-and-folders_funcs/
function_funcs/
kung-fu-blog_funcs/
networking_funcs/
nmap_funcs/
#comment
############################################


function get-filesNameOnly () {
  if [ -d "$1" ]; then
    ls "$1" -1 -p
  else
    ls -1 -p
  fi
}


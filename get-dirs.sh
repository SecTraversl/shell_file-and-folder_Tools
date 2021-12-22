#!/bin/bash

############################################
# SYNOPSIS
# - The "get-dirs" function returns any names of sub-directories that are in the current directory (by default).  If an argument is given which is a valid directory name, then the function returns the names of sub-directories in that directory. 
#
###########
# NOTES
# - Name:  get-dirs.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - File-based "if" conditions such as '-d' for validating the arg is a directory:  https://acloudguru.com/blog/engineering/conditions-in-bash-scripting-if-statements
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when running the function ...

temp_dir$ get-dirs 
.
./some_random_dir
./test_dir
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output when referencing the parent directory ...

temp$ get-dirs ..
..
../function_funcs
../prompt_funcs
../nmap_funcs
../kung-fu-blog_funcs
../python-helper_funcs
../networking_funcs
../aws-cli_funcs
../temp
../storage-space_funcs
../user-and-group_funcs
../variables-and-env_funcs
../alias_funcs
../files-and-folders_funcs
#comment
############################################


function get-dirs () {
  if [ -d "$1" ]; then
    find "$1" -maxdepth 1 -type d
  else
    find . -maxdepth 1 -type d
  fi
}


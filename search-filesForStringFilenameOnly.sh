#!/bin/bash

############################################
# SYNOPSIS
# - The "search-filesForStringFilenameOnly" function takes a given Regular Expression pattern and searches for that pattern within files in the current directory and returns the name of the file containing the match.
#
###########
# NOTES
# - Name:  search-filesForStringFilenameOnly.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - This was helpful:  https://stackoverflow.com/questions/1987926/how-do-i-grep-recursively

#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when the function is run ...

my_bash_funcs$ search-filesForStringFilenameOnly '^function '
notes_tutorial-on-bash-functions.sh
worksheet.sh
#comment
############################################


function search-filesForStringFilenameOnly () {
  grep -l "$1" *.*
}


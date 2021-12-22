#!/bin/bash

############################################
# SYNOPSIS
# - The "measure-fileCharacterCount" function takes a given file name and returns the number of characters in the file and the file name.
#
###########
# NOTES
# - Name:  measure-fileCharacterCount.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - 
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when running the function ...

temp$ measure-fileCharacterCount notes_block-comments.sh 
864 notes_block-comments.sh
#comment
############################################


function measure-fileCharacterCount () {
  wc -c $1
}


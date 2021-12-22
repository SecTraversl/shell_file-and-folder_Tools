#!/bin/bash

############################################
# SYNOPSIS
# - The "measure-fileLineCount" function takes a given file and returns the line count of the file and the file name.
#
###########
# NOTES
# - Name:  measure-fileLineCount.sh
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

temp$ measure-fileLineCount notes_block-comments.sh 
16 notes_block-comments.sh
#comment
############################################


function measure-fileLineCount () {
  wc -l $1
}


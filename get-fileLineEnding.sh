#!/bin/bash

############################################
# SYNOPSIS
# - The "get-fileLineEnding" function 
#
###########
# NOTES
# - Name:  get-fileLineEnding.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - Convert DOS to UNIX file ending:  http://blog.commandlinekungfu.com/2009/02/
#   - This idea for 'cat -e' and for using the 'file' command came from here:  https://stackoverflow.com/questions/3569997/how-to-find-out-line-endings-in-a-text-file
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function when we reference a text file created on a Linux system ...

temp$ get-fileLineEnding ../Text-file-created-on-Linux-via-the-cli.txt 
../Text-file-created-on-Linux-via-the-cli.txt: ASCII text
Appears to be have UNIX line endings (LF)
here is$
a $
text$
file$
from a$
Linux cli$
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function when we reference a text file created on a Windows system ...

temp$ get-fileLineEnding ../Text-file-created-on-Windows-by-notepad.txt 
../Text-file-created-on-Windows-by-notepad.txt: ASCII text, with CRLF line terminators
Appears to be have Windows line endings (CRLF)
here^M$
is^M$
a^M$
text file^M$
from a ^M$
Windows notepad.exe^M$
#comment
############################################


function get-fileLineEnding () {
  
  # Here we are testing if the file ends with the characters ^M$
  local IsWindowsLineEnding=$(head "$1" | cat -e | grep "\^M\$$")
  # Here we are testing if the file ends with the character $, but not ^M$
  local IsUnixLineEnding=$(head "$1" | cat -e | grep "[^\^][^M]\$$")

  if [ "$IsWindowsLineEnding" ]; then
    file "$1"
    echo 'Appears to be have Windows line endings (CRLF)'
    echo "$IsWindowsLineEnding"
  elif [ "$IsUnixLineEnding" ]; then
    file "$1"
    echo 'Appears to be have UNIX line endings (LF)'
    echo "$IsUnixLineEnding"
  else
    echo "Didn't detect the line endings for the text file."
  fi

}


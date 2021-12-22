#!/bin/bash

############################################
# SYNOPSIS
# - The "search-filesForStringWithLineNums" function takes a given Regular Expression pattern and searches for that pattern within files in the current directory.
#
###########
# NOTES
# - Name:  search-filesForStringWithLineNums.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - This was helpful:  https://stackoverflow.com/questions/1987926/how-do-i-grep-recursively
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when we run the function ...

my_bash_funcs$ search-filesForStringWithLineNums '^function '
notes_tutorial-on-bash-functions.sh:9:function args () {
notes_tutorial-on-bash-functions.sh:37:function test () {
notes_tutorial-on-bash-functions.sh:58:function sub () {
notes_tutorial-on-bash-functions.sh:81:function global-var () {
notes_tutorial-on-bash-functions.sh:96:function return-status () {
notes_tutorial-on-bash-functions.sh:109:function measure-fileLineCount () {
worksheet.sh:2:function measure-fileLineCount () {
worksheet.sh:7:function measure-fileCharacterCount () {
#comment
############################################


function search-filesForStringWithLineNums () {
  grep -n "$1" *.*
}


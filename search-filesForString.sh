#!/bin/bash

############################################
# SYNOPSIS
# - The "search-filesForString" function takes a given Regular Expression pattern and searches for that pattern within files in the current directory and returns the name of the file containing the match and the line where the match occurred. 
#
###########
# NOTES
# - Name:  search-filesForString.sh
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

my_bash_funcs$ search-filesForString '^function '
notes_tutorial-on-bash-functions.sh:function args () {
notes_tutorial-on-bash-functions.sh:function test () {
notes_tutorial-on-bash-functions.sh:function sub () {
notes_tutorial-on-bash-functions.sh:function global-var () {
notes_tutorial-on-bash-functions.sh:function return-status () {
notes_tutorial-on-bash-functions.sh:function measure-fileLineCount () {
worksheet.sh:function measure-fileLineCount () {
worksheet.sh:function measure-fileCharacterCount () {
#comment
############################################


function search-filesForString () {
  grep "$1" *.*
}


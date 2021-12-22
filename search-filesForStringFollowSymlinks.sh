#!/bin/bash

############################################
# SYNOPSIS
# - The "search-filesForStringFollowSymlinks" function takes a given Regular Expression pattern and searches for that pattern within files in the current directory and any sub-directories, with the additional aspect of displaying the targets for any files that are symlinks.
#
###########
# NOTES
# - Name:  search-filesForStringFollowSymlinks.sh
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

my_bash_funcs$ search-filesForStringFollowSymlinks '^function '
worksheet.sh:function measure-fileLineCount () {
worksheet.sh:function measure-fileCharacterCount () {
prompt_funcs/prompt-tools.sh:function get-prompt () {
prompt_funcs/prompt-tools.sh:function save-promptOriginal () {
prompt_funcs/prompt-tools.sh:function change-prompt () {
notes_tutorial-on-bash-functions.sh:function args () {
notes_tutorial-on-bash-functions.sh:function test () {
notes_tutorial-on-bash-functions.sh:function sub () {
notes_tutorial-on-bash-functions.sh:function global-var () {
notes_tutorial-on-bash-functions.sh:function return-status () {
notes_tutorial-on-bash-functions.sh:function measure-fileLineCount () {
files-and-folders_funcs/measure-file.sh:function measure-fileCharacterCount () {
files-and-folders_funcs/measure-file.sh:function measure-fileLineCount () {
files-and-folders_funcs/search-filesForString.sh:function search-filesForString () {
files-and-folders_funcs/search-filesForString.sh:function search-filesForStringRecursively () {
files-and-folders_funcs/search-filesForString.sh:function search-filesForStringFollowSymlinks () {
files-and-folders_funcs/search-filesForString.sh:function search-filesForStringWithLineNums () {
files-and-folders_funcs/search-filesForString.sh:function search-filesForStringFilenameOnly () {
files-and-folders_funcs/sort-files.sh:function sort-filesBySize () {
files-and-folders_funcs/sort-files.sh:function sort-filesBySizeTrimmed () {
files-and-folders_funcs/sort-files.sh:function sort-filesBySizeRecursively () {
files-and-folders_funcs/sort-files.sh:function sort-filesBySizeIncludeDirectories () {
files-and-folders_funcs/sort-files.sh:function sort-filesBySizeDirectoriesOnly () {
files-and-folders_funcs/sort-files.sh:function sort-filesByTimestamp () {
files-and-folders_funcs/sort-files.sh:function sort-filesByTimestampTrimmed () {
files-and-folders_funcs/sort-files.sh:function sort-filesByTimestampRecursively () {
files-and-folders_funcs/sort-files.sh:function sort-filesByTimestampIncludeDirectories () {
files-and-folders_funcs/sort-files.sh:function sort-filesByTimestampDirectoriesOnly () {
#comment
############################################


function search-filesForStringFollowSymlinks () {
  grep -R "$1"
}


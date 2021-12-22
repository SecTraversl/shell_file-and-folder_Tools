#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesBySizeTrimOutput" function displays the files in the present directory (by default) in order of file size (but omits the file size from the output).  If an argument is given that is another directory, the function will display the files in that directory in order of size.
#
###########
# NOTES
# - Name:  sort-filesBySizeTrimOutput.sh
# - Author:  Travis Logue
# - Version History:  1.2 | Added test to ensure arg is a directory
# - Dependencies:  
# - Notes:
#   - Sort files by date modified:  https://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified
#   - Use "find" without recursion:  https://stackoverflow.com/questions/3925337/find-without-recursion
#   - Test if the $1 is a directory with "-d":  https://acloudguru.com/blog/engineering/conditions-in-bash-scripting-if-statements
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output of the function without any arguments (defaults to present dir) ...

temp$ sort-filesBySizeTrimOutput 
Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Linux-via-the-cli.txt
Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Windows-by-notepad.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function by supplying an argument referencing the parent dir ...

temp$ sort-filesBySizeTrimOutput ..
Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
Tue 19 Oct 2021 08:07:00 AM PDT      4 KiB ./notes_echo-with-newline-chars.txt
Thu 07 Oct 2021 06:08:38 PM PDT      4 KiB ./notes_block-comments.txt
Fri 15 Oct 2021 04:47:40 PM PDT      4 KiB ./notes_line-numbers-awk-and-more.txt
Wed 17 Nov 2021 07:38:05 AM PST      4 KiB ./shellscript.json.txt
Wed 17 Nov 2021 01:58:55 PM PST      4 KiB ./bash_functions_import.sh
Tue 19 Oct 2021 10:50:25 AM PDT      4 KiB ./notes_rename-files_worksheet.txt
Thu 07 Oct 2021 06:08:45 PM PDT      4 KiB ./notes_tutorial-on-bash-functions.txt
Wed 20 Oct 2021 07:20:15 PM PDT      8 KiB ./worksheet.txt
Mon 18 Oct 2021 07:10:02 AM PDT     12 KiB ./notes_eval_getent_py_get-users.txt
Wed 20 Oct 2021 07:20:29 PM PDT     16 KiB ./notes_awk-sed-xargs-experiments.txt
#comment
############################################


function sort-filesBySizeTrimOutput () {
  if [ "$1" ]; then
    cd "$1"
    find -maxdepth 1 -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n | cut -f 2-
    cd - 1>/dev/null
  else
    find . -maxdepth 1 -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n | cut -f 2-
  fi 
}


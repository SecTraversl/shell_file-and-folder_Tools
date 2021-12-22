#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesByTimestampTrimOutput" function sorts the files in the present directory (by default) from the least-recently-changed file to the most-recently-changed file (while omitting the leading epoch timestamp used for sorting).  If an argument that is a directory path is given to the function, then it will display the files in that directory. 
#
###########
# NOTES
# - Name:  sort-filesByTimestampTrimOutput.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - Sort files by date modified:  https://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified
#   - Use "find" without recursion:  https://stackoverflow.com/questions/3925337/find-without-recursion
#   - Test if the $1 is a directory with "-d":  https://acloudguru.com/blog/engineering/conditions-in-bash-scripting-if-statements
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output when using the function without any arguments ...

temp$ sort-filesByTimestampTrimOutput 
Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Windows-by-notepad.txt
Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Linux-via-the-cli.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal when referencing a directory path as the argument ...

temp$ sort-filesByTimestampTrimOutput ..
Thu 07 Oct 2021 06:08:38 PM PDT      4 KiB ./notes_block-comments.txt
Thu 07 Oct 2021 06:08:45 PM PDT      4 KiB ./notes_tutorial-on-bash-functions.txt
Fri 15 Oct 2021 04:47:40 PM PDT      4 KiB ./notes_line-numbers-awk-and-more.txt
Mon 18 Oct 2021 07:10:02 AM PDT     12 KiB ./notes_eval_getent_py_get-users.txt
Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
Tue 19 Oct 2021 08:07:00 AM PDT      4 KiB ./notes_echo-with-newline-chars.txt
Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
Tue 19 Oct 2021 10:50:25 AM PDT      4 KiB ./notes_rename-files_worksheet.txt
Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
Wed 20 Oct 2021 07:20:15 PM PDT      8 KiB ./worksheet.txt
Wed 20 Oct 2021 07:20:29 PM PDT     16 KiB ./notes_awk-sed-xargs-experiments.txt
Wed 17 Nov 2021 07:38:05 AM PST      4 KiB ./shellscript.json.txt
Sat 27 Nov 2021 11:54:31 AM PST     20 KiB ./notes_tutorial-and-urls-bash-functions.txt
Sun 28 Nov 2021 06:35:11 AM PST      4 KiB ./bash_functions_import.sh
#comment
############################################


function sort-filesByTimestampTrimOutput () {
  if [ "$1" ]; then
    if [ -d "$1" ]; then
      cd "$1"
      find -maxdepth 1 -type f -printf "%T@\t%Tc %6k KiB %p\n" | sort -n | cut -f 2-
      cd - 1>/dev/null
    else
      echo -e "\nThe given argument is not a directory.\n"
    fi
  else
    find . -maxdepth 1 -type f -printf "%T@\t%Tc %6k KiB %p\n" | sort -n | cut -f 2-
  fi 
}


#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesBySizeRecursively" function displays the files starting in the present directory and recursing through any subdirectories (by default) in order of file size.  If an argument is given that is another directory, the function will display the files in that directory in order of size.
#
###########
# NOTES
# - Name:  sort-filesBySizeRecursively.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - Sort files by date modified:  https://superuser.com/questions/294161/unix-linux-find-and-sort-by-date-modified
#   - Use "find" without recursion:  https://stackoverflow.com/questions/3925337/find-without-recursion
#
###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal output of the function without any arguments (defaults to present dir) ...

temp$ sort-filesBySizeRecursively
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Windows-by-notepad.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function by supplying an argument referencing the parent dir ...

temp$ sort-filesBySizeRecursively ..
0       Wed 17 Nov 2021 03:33:52 PM PST      0 KiB ./files-and-folders_funcs/sort-filesBySizeRecursively.sh
46      Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./temp/my_Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./temp/my_Text-file-created-on-Windows-by-notepad.txt
249     Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
251     Wed 17 Nov 2021 01:34:51 PM PST      4 KiB ./networking_funcs/get-ipaddressAll.sh
387     Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
397     Wed 20 Oct 2021 08:12:00 AM PDT      4 KiB ./column-select-sort-and-split_funcs/special-columnParsingExample.txt
476     Wed 06 Oct 2021 03:13:11 PM PDT      4 KiB ./files-and-folders_funcs/measure-file.sh
534     Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
547     Tue 19 Oct 2021 09:27:32 AM PDT      4 KiB ./files-and-folders_funcs/rename-filesExample.sh
609     Wed 17 Nov 2021 11:31:52 AM PST      4 KiB ./prompt_funcs/get-prompt.sh
628     Wed 17 Nov 2021 11:31:46 AM PST      4 KiB ./prompt_funcs/change-prompt.sh
#comment
############################################


function sort-filesBySizeRecursively () {
  if [ "$1" ]; then
    cd "$1"
    find -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n
    cd - 1>/dev/null
  else
    find . -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


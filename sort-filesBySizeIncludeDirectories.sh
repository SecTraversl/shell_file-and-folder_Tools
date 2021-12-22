#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesBySizeIncludeDirectories" function displays the files and any subdirectories in the present directory (by default) in order of file size.  If an argument is given that is another directory, the function will display the files/subdirectories in that directory in order of size.
#
###########
# NOTES
# - Name:  sort-filesBySizeIncludeDirectories.sh
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

temp$ sort-filesBySizeIncludeDirectories 
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Windows-by-notepad.txt
4096    Wed 17 Nov 2021 02:05:39 PM PST      4 KiB .
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function by supplying an argument referencing the parent dir ...

temp$ sort-filesBySizeIncludeDirectories ..
46      Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
249     Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
387     Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
534     Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
716     Tue 19 Oct 2021 08:07:00 AM PDT      4 KiB ./notes_echo-with-newline-chars.txt
864     Thu 07 Oct 2021 06:08:38 PM PDT      4 KiB ./notes_block-comments.txt
1379    Fri 15 Oct 2021 04:47:40 PM PDT      4 KiB ./notes_line-numbers-awk-and-more.txt
1578    Wed 17 Nov 2021 07:38:05 AM PST      4 KiB ./shellscript.json.txt
1911    Wed 17 Nov 2021 03:33:24 PM PST      4 KiB ./bash_functions_import.sh
2707    Tue 19 Oct 2021 10:50:25 AM PDT      4 KiB ./notes_rename-files_worksheet.txt
3845    Thu 07 Oct 2021 06:08:45 PM PDT      4 KiB ./notes_tutorial-on-bash-functions.txt
4096    Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
4096    Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
4096    Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
4096    Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
4096    Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
4096    Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
4096    Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
4096    Wed 17 Nov 2021 02:05:39 PM PST      4 KiB ./temp
4096    Wed 17 Nov 2021 03:40:05 PM PST      4 KiB ./files-and-folders_funcs
4096    Wed 17 Nov 2021 07:09:35 AM PST      4 KiB .
#comment
############################################


function sort-filesBySizeIncludeDirectories () {
  if [ "$1" ]; then
    cd "$1"
    find -maxdepth 1 -printf "%s\t%Tc %6k KiB %p\n" | sort -n
    cd - 1>/dev/null
  else
    find . -maxdepth 1 -printf "%s\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


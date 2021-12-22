#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesBySize" function displays the files in the present directory (by default) in order of file size.  If an argument that is a directory path is given to the function, then it will display the files in that directory.
#
###########
# NOTES
# - Name:  sort-filesBySize.sh
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

temp$ sort-filesBySize
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Windows-by-notepad.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function by supplying an argument referencing a dir ...

temp$ cd ..
Bash_Functions$ sort-filesBySize temp/
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Linux-via-the-cli.txt
46      Tue 19 Oct 2021 08:20:32 AM PDT      4 KiB ./my_Text-file-created-on-Windows-by-notepad.txt
#comment
############################################


function sort-filesBySize () {
  if [ "$1" ]; then
    if [ -d "$1" ]; then
      cd "$1"
      find -maxdepth 1 -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n
      cd - 1>/dev/null
    else
      echo -e "\nThe given argument is not a directory.\n"
    fi
  else
    find . -maxdepth 1 -type f -printf "%s\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


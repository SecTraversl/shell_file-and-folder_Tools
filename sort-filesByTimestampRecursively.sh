#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesByTimestampRecursively" function sorts the files starting in the present directory (by default), while recursing through sub-directories, and displays the files found from the least-recently-changed file to the most-recently-changed file.  If an argument that is a directory path is given to the function, then it will display files in that directory as well as any sub-directories.
#
###########
# NOTES
# - Name:  sort-filesByTimestampRecursively.sh
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
# ... Here we show the normal output when using the function without any arguments ...

temp$ sort-filesByTimestampRecursively 
1638059501.0913236140   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Windows-by-notepad.txt
1638059501.2273201960   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Linux-via-the-cli.txt
1638112963.5216899840   Sun 28 Nov 2021 07:22:43 AM PST      0 KiB ./some_random_dir/the_file_to_test.txt
1638112978.3379225670   Sun 28 Nov 2021 07:22:58 AM PST      0 KiB ./test_dir/another_test_file.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal when referencing a directory path as the argument ...

temp$ cd ..
Bash_Functions$ sort-filesByTimestampRecursively temp/
1638059501.0913236140   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Windows-by-notepad.txt
1638059501.2273201960   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./text-file-created-on-Linux-via-the-cli.txt
1638112963.5216899840   Sun 28 Nov 2021 07:22:43 AM PST      0 KiB ./some_random_dir/the_file_to_test.txt
1638112978.3379225670   Sun 28 Nov 2021 07:22:58 AM PST      0 KiB ./test_dir/another_test_file.txt
#comment
############################################


function sort-filesByTimestampRecursively () {
  if [ "$1" ]; then
    if [ -d "$1" ]; then
      cd "$1"
      find -type f -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
      cd - 1>/dev/null
    else
      echo -e "\nThe given argument is not a directory.\n"
    fi
  else
    find . -type f -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


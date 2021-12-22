#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesByTimestampDirectoriesOnly" function sorts the sub-directories in the present directory (by default) from the least-recently-changed sub-directory to the most-recently-changed sub-directory.  If an argument that is a directory path is given to the function, then it will display the sub-directories in that directory.
#
###########
# NOTES
# - Name:  sort-filesByTimestampDirectoriesOnly.sh
# - Author:  Travis Logue
# - Version History:  1.2 | Initial Version
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

Bash_Functions$ sort-filesByTimestampDirectoriesOnly 
1633488117.8072374300   Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
1633727470.6285610680   Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
1634390959.4548407300   Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
1634600139.8286334080   Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
1634755699.4512204410   Wed 20 Oct 2021 11:48:19 AM PDT      4 KiB ./column-select-sort-and-split_funcs
1637167781.8000686950   Wed 17 Nov 2021 08:49:41 AM PST      4 KiB ./user-and-group_funcs
1637168926.0829004140   Wed 17 Nov 2021 09:08:46 AM PST      4 KiB ./storage-space_funcs
1637170048.9452140120   Wed 17 Nov 2021 09:27:28 AM PST      4 KiB ./python-helper_funcs
1637171879.4945943710   Wed 17 Nov 2021 09:57:59 AM PST      4 KiB ./prompt_funcs
1637177913.1685982090   Wed 17 Nov 2021 11:38:33 AM PST      4 KiB ./nmap_funcs
1637185829.2341703170   Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
1638059501.2153204980   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./temp
1638062904.7079389970   Sat 27 Nov 2021 05:28:24 PM PST      4 KiB .
1638063569.1797361730   Sat 27 Nov 2021 05:39:29 PM PST      4 KiB ./display-resolution_funcs
1638109858.7316559200   Sun 28 Nov 2021 06:30:58 AM PST      4 KiB ./files-and-folders_funcs
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal when referencing a directory path as the argument ...

Bash_Functions$ cd ..
IMPORT_functions$ sort-filesByTimestampDirectoriesOnly Bash_Functions/
1633488117.8072374300   Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
1633727470.6285610680   Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
1634390959.4548407300   Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
1634600139.8286334080   Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
1634755699.4512204410   Wed 20 Oct 2021 11:48:19 AM PDT      4 KiB ./column-select-sort-and-split_funcs
1637167781.8000686950   Wed 17 Nov 2021 08:49:41 AM PST      4 KiB ./user-and-group_funcs
1637168926.0829004140   Wed 17 Nov 2021 09:08:46 AM PST      4 KiB ./storage-space_funcs
1637170048.9452140120   Wed 17 Nov 2021 09:27:28 AM PST      4 KiB ./python-helper_funcs
1637171879.4945943710   Wed 17 Nov 2021 09:57:59 AM PST      4 KiB ./prompt_funcs
1637177913.1685982090   Wed 17 Nov 2021 11:38:33 AM PST      4 KiB ./nmap_funcs
1637185829.2341703170   Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
1638059501.2153204980   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./temp
1638062904.7079389970   Sat 27 Nov 2021 05:28:24 PM PST      4 KiB .
1638063569.1797361730   Sat 27 Nov 2021 05:39:29 PM PST      4 KiB ./display-resolution_funcs
1638109858.7316559200   Sun 28 Nov 2021 06:30:58 AM PST      4 KiB ./files-and-folders_funcs
#comment
############################################


function sort-filesByTimestampDirectoriesOnly () {
  if [ "$1" ]; then
    if [ -d "$1" ]; then
      cd "$1"
      find -maxdepth 1 -type d -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
      cd - 1>/dev/null
    else
      echo -e "\nThe given argument is not a directory.\n"
    fi
  else
    find . -maxdepth 1 -type d -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


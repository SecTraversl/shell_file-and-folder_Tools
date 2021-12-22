#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesByTimestampIncludeDirectories" function sorts the files/sub-directories in the present directory (by default) from the least-recently-changed file to the most-recently-changed file.  If an argument that is a directory path is given to the function, then it will display the files/sub-directories in that directory. 
#
###########
# NOTES
# - Name:  sort-filesByTimestampIncludeDirectories.sh
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

Bash_Functions$ sort-filesByTimestampIncludeDirectories 
1633488117.8072374300   Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
1633655318.2480000000   Thu 07 Oct 2021 06:08:38 PM PDT      4 KiB ./notes_block-comments.txt
1633655325.1120000000   Thu 07 Oct 2021 06:08:45 PM PDT      4 KiB ./notes_tutorial-on-bash-functions.txt
1633727470.6285610680   Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
1634341660.1777705910   Fri 15 Oct 2021 04:47:40 PM PDT      4 KiB ./notes_line-numbers-awk-and-more.txt
1634390959.4548407300   Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
1634566202.3538228060   Mon 18 Oct 2021 07:10:02 AM PDT     12 KiB ./notes_eval_getent_py_get-users.txt
1634600139.8286334080   Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
1634606795.8440000000   Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
1634656020.3132072030   Tue 19 Oct 2021 08:07:00 AM PDT      4 KiB ./notes_echo-with-newline-chars.txt
1634656817.3482448640   Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
1634660900.1808727820   Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
1634665825.4022322820   Tue 19 Oct 2021 10:50:25 AM PDT      4 KiB ./notes_rename-files_worksheet.txt
1634683424.6044543550   Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
1634742309.2310000000   Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
1634755699.4512204410   Wed 20 Oct 2021 11:48:19 AM PDT      4 KiB ./column-select-sort-and-split_funcs
1634782815.9734587330   Wed 20 Oct 2021 07:20:15 PM PDT      8 KiB ./worksheet.txt
1634782829.6692528160   Wed 20 Oct 2021 07:20:29 PM PDT     16 KiB ./notes_awk-sed-xargs-experiments.txt
1637167781.8000686950   Wed 17 Nov 2021 08:49:41 AM PST      4 KiB ./user-and-group_funcs
1637168926.0829004140   Wed 17 Nov 2021 09:08:46 AM PST      4 KiB ./storage-space_funcs
1637170048.9452140120   Wed 17 Nov 2021 09:27:28 AM PST      4 KiB ./python-helper_funcs
1637171879.4945943710   Wed 17 Nov 2021 09:57:59 AM PST      4 KiB ./prompt_funcs
1637177913.1685982090   Wed 17 Nov 2021 11:38:33 AM PST      4 KiB ./nmap_funcs
1637185829.2341703170   Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
1638042871.4250000000   Sat 27 Nov 2021 11:54:31 AM PST     20 KiB ./notes_tutorial-and-urls-bash-functions.txt
1638059501.2153204980   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./temp
1638062904.7079389970   Sat 27 Nov 2021 05:28:24 PM PST      4 KiB .
1638063569.1797361730   Sat 27 Nov 2021 05:39:29 PM PST      4 KiB ./display-resolution_funcs
1638109858.7316559200   Sun 28 Nov 2021 06:30:58 AM PST      4 KiB ./files-and-folders_funcs
1638111168.7523680490   Sun 28 Nov 2021 06:52:48 AM PST      4 KiB ./bash_functions_import.sh
1638111827.1915925600   Sun 28 Nov 2021 07:03:47 AM PST      4 KiB ./shellscript.json.txt
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the normal when referencing a directory path as the argument ...

Bash_Functions$ cd ..
IMPORT_functions$ sort-filesByTimestampIncludeDirectories Bash_Functions/
1633488117.8072374300   Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
1633655318.2480000000   Thu 07 Oct 2021 06:08:38 PM PDT      4 KiB ./notes_block-comments.txt
1633655325.1120000000   Thu 07 Oct 2021 06:08:45 PM PDT      4 KiB ./notes_tutorial-on-bash-functions.txt
1633727470.6285610680   Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
1634341660.1777705910   Fri 15 Oct 2021 04:47:40 PM PDT      4 KiB ./notes_line-numbers-awk-and-more.txt
1634390959.4548407300   Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
1634566202.3538228060   Mon 18 Oct 2021 07:10:02 AM PDT     12 KiB ./notes_eval_getent_py_get-users.txt
1634600139.8286334080   Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
1634606795.8440000000   Mon 18 Oct 2021 06:26:35 PM PDT      4 KiB ./Text-file-created-on-Linux-via-the-cli.txt
1634656020.3132072030   Tue 19 Oct 2021 08:07:00 AM PDT      4 KiB ./notes_echo-with-newline-chars.txt
1634656817.3482448640   Tue 19 Oct 2021 08:20:17 AM PDT      4 KiB ./Text-file-created-on-Windows-by-notepad.txt
1634660900.1808727820   Tue 19 Oct 2021 09:28:20 AM PDT      4 KiB ./notes_execute-string-by-piping-to-sh.txt
1634665825.4022322820   Tue 19 Oct 2021 10:50:25 AM PDT      4 KiB ./notes_rename-files_worksheet.txt
1634683424.6044543550   Tue 19 Oct 2021 03:43:44 PM PDT      4 KiB ./iplogs.txt
1634742309.2310000000   Wed 20 Oct 2021 08:05:09 AM PDT      4 KiB ./notes_send-stderr-to-dev-null.txt
1634755699.4512204410   Wed 20 Oct 2021 11:48:19 AM PDT      4 KiB ./column-select-sort-and-split_funcs
1634782815.9734587330   Wed 20 Oct 2021 07:20:15 PM PDT      8 KiB ./worksheet.txt
1634782829.6692528160   Wed 20 Oct 2021 07:20:29 PM PDT     16 KiB ./notes_awk-sed-xargs-experiments.txt
1637167781.8000686950   Wed 17 Nov 2021 08:49:41 AM PST      4 KiB ./user-and-group_funcs
1637168926.0829004140   Wed 17 Nov 2021 09:08:46 AM PST      4 KiB ./storage-space_funcs
1637170048.9452140120   Wed 17 Nov 2021 09:27:28 AM PST      4 KiB ./python-helper_funcs
1637171879.4945943710   Wed 17 Nov 2021 09:57:59 AM PST      4 KiB ./prompt_funcs
1637177913.1685982090   Wed 17 Nov 2021 11:38:33 AM PST      4 KiB ./nmap_funcs
1637185829.2341703170   Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
1637186349.8604925720   Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
1638042871.4250000000   Sat 27 Nov 2021 11:54:31 AM PST     20 KiB ./notes_tutorial-and-urls-bash-functions.txt
1638059501.2153204980   Sat 27 Nov 2021 04:31:41 PM PST      4 KiB ./temp
1638062904.7079389970   Sat 27 Nov 2021 05:28:24 PM PST      4 KiB .
1638063569.1797361730   Sat 27 Nov 2021 05:39:29 PM PST      4 KiB ./display-resolution_funcs
1638109858.7316559200   Sun 28 Nov 2021 06:30:58 AM PST      4 KiB ./files-and-folders_funcs
1638111168.7523680490   Sun 28 Nov 2021 06:52:48 AM PST      4 KiB ./bash_functions_import.sh
1638111827.1915925600   Sun 28 Nov 2021 07:03:47 AM PST      4 KiB ./shellscript.json.txt
#comment
############################################


function sort-filesByTimestampIncludeDirectories () {
  if [ "$1" ]; then
    if [ -d "$1" ]; then
      cd "$1"
      find -maxdepth 1 -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
      cd - 1>/dev/null
    else
      echo -e "\nThe given argument is not a directory.\n"
    fi
  else
    find . -maxdepth 1 -printf "%T@\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


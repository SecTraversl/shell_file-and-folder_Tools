#!/bin/bash

############################################
# SYNOPSIS
# - The "sort-filesBySizeDirectoriesOnly" function displays the files and any subdirectories in the present directory (by default) in order of file size.  If an argument is given that is another directory, the function will display the files/subdirectories in that directory in order of size.
#
###########
# NOTES
# - Name:  sort-filesBySizeDirectoriesOnly.sh
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

temp$ sort-filesBySizeDirectoriesOnly 4096    Wed 17 Nov 2021 02:05:39 PM PST      4 KiB .
#comment

###########
# EXAMPLE
<< '#comment'
# ... Here we show the output of the function by supplying an argument referencing the parent dir ...

temp$ sort-filesBySizeDirectoriesOnly ..
4096    Fri 08 Oct 2021 02:11:10 PM PDT      4 KiB ./aws-cli_funcs
4096    Mon 18 Oct 2021 04:35:39 PM PDT      4 KiB ./kung-fu-blog_funcs
4096    Sat 16 Oct 2021 06:29:19 AM PDT      4 KiB ./alias_funcs
4096    Tue 05 Oct 2021 07:41:57 PM PDT      4 KiB ./variables-and-env_funcs
4096    Wed 17 Nov 2021 01:50:29 PM PST      4 KiB ./networking_funcs
4096    Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./_bash_eventual-discard
4096    Wed 17 Nov 2021 01:59:09 PM PST      4 KiB ./function_funcs
4096    Wed 17 Nov 2021 02:05:39 PM PST      4 KiB ./temp
4096    Wed 17 Nov 2021 03:44:51 PM PST      4 KiB ./files-and-folders_funcs
4096    Wed 17 Nov 2021 07:09:35 AM PST      4 KiB .
4096    Wed 17 Nov 2021 08:49:41 AM PST      4 KiB ./user-and-group_funcs
4096    Wed 17 Nov 2021 09:08:46 AM PST      4 KiB ./storage-space_funcs
4096    Wed 17 Nov 2021 09:27:28 AM PST      4 KiB ./python-helper_funcs
4096    Wed 17 Nov 2021 09:57:59 AM PST      4 KiB ./prompt_funcs
4096    Wed 17 Nov 2021 11:38:33 AM PST      4 KiB ./nmap_funcs
4096    Wed 20 Oct 2021 11:48:19 AM PDT      4 KiB ./column-select-sort-and-split_funcs
#comment
############################################


function sort-filesBySizeDirectoriesOnly () {
  if [ "$1" ]; then
    cd "$1"
    find -maxdepth 1 -type d -printf "%s\t%Tc %6k KiB %p\n" | sort -n
    cd - 1>/dev/null
  else
    find . -maxdepth 1 -type d -printf "%s\t%Tc %6k KiB %p\n" | sort -n
  fi 
}


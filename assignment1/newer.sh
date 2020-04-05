#/bin/bash
result=$1  #default variable by using the first file for comparing
 for i in $*; do  #looping for every file that type (if 3 file then the process is looping 3 time)
   if [ "$i" -nt "$result" ]; then #check if the existing file is newer than the variable $result
    result=$i #if newer than variable result is replace by the newer file
   fi
 done
echo $result #display the newest file

#/bin/bash
 for i in $*; do
   result="$1"
   if [ "$i" -nt "$result" ]; then
    result=$i
   fi
 done
echo $result

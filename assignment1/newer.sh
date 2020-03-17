#/bin/bash
result=$1
 for i in $*; do
   if [ "$i" -nt "$result" ]; then
    result=$i
   fi
 done
echo $result

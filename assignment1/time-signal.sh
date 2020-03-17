#!/bin/bash
# save as time-signal.sh
# gives a time signal every hour when connected to cron
time=$(date +%I)
count=0
while test $count -lt $time; do
  echo -e "\a"
  sleep 1 # sleep for one second
count=$((count+1))
done
sleep 3 #sleep for three second
count2=0
time=$(date +%M)
echo "menit sekarang: $time"
if (($time >= 15 && $time <= 30)) ; then
while test $count2 -lt 1; do
echo -e "chime minute $count2\a"
sleep 1
count2=$((count2+1))
done
elif (($time > 30 && $time <= 45)) ; then
while test $count2 -lt 2; do
echo -e "chime minute $count2\a"
sleep 1
count2=$((count2+1))
done
elif (($time > 45 && $time <= 60)) ; then
while test $count2 -lt 3; do
echo -e "chime minute $count2\a"
sleep 1
count2=$((count2+1))
done
fi

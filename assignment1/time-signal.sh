#!/bin/bash
# save as time-signal.sh
# gives a time signal every hour when connected to cron
time=$(date +%I) #variable to check the current HOUR
count=0
while test $count -lt $time; do
  echo -e "\a"
  sleep 1 # sleep for one second
count=$((count+1))
done
sleep 3 #sleep for three second
count2=0 #new variable for limiting the count of chime
time=$(date +%M) #variable to check the current MINUTE
echo "menit sekarang: $time"
if (($time >= 15 && $time <= 30)) ; then #if the minute lies between 15 and 30
while test $count2 -lt 1; do #because count2 start from 0, -lt means lower than 1, so it will chime once
echo -e "chime minute $count2\a"  #\a used to make the noise
sleep 1 #delay for 1 sec
count2=$((count2+1))
done #finish iteration
elif (($time > 30 && $time <= 45)) ; then #if the minute lies between 30 and 45
while test $count2 -lt 2; do #because count2 start from 0, -lt means lower than 2, so it will chime twice
echo -e "chime minute $count2\a"   #\a used to make the noise
sleep 1
count2=$((count2+1)) #increment the count2 so the while can be finished
done
elif (($time > 45 && $time <= 60)) ; then #if the minute lies between 45 and 60
while test $count2 -lt 3; do #because count2 start from 0, -lt means lower than 3, so it will chime three times
echo -e "chime minute $count2\a"
sleep 1
count2=$((count2+1))
done
fi

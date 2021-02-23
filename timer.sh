#/bin/sh

#TODO: Add usage and a default timer amount.

TIME_IN_SECOUNDS=$1;
if [[ -z $1 ]];
then 
 TIME_IN_SECOUNDS=60;
 echo "Usage: ./timer.sh <seconds>"
 echo "Defaulting to 60 seconds also known as one minute"
 echo "as a demo."
fi
#TODO: Add 80 char max length for status bar

echo Start time 
date
echo 
echo
for (( i=1; i<=$TIME_IN_SECOUNDS; i++ ))
do
 sleep 1;
 printf "\033[F\r"
 printf "\033[F\r"
 for(( j=0; j<i; j++))  
  do
  printf "*"
  done
  for(( j=0; j<$TIME_IN_SECOUNDS-i; j++))
  do
  printf "."
  done 
 printf "\n" 
 date
 done
echo Times Up!
date
#TODO:play sound

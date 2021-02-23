#/bin/sh

TIME_IN_SECOUNDS=$1;
if [[ -z $1 ]];
then 
 TIME_IN_SECOUNDS=60;
 echo "Usage: ./timer.sh <seconds>"
 echo "Defaulting to 60 seconds also known as one minute"
 echo "as a demo."
 echo "Currently the timer is inaccurate due to sleep + console for example at 10 minutes it is +/- ~5 secounds"
 #TODO: Switch from sleep 1 to using system time.
fi
#TODO: Work out math for progress bar that represents the whole time.

BAR_LENGTH=80;
INTERVAL_SIZE=$BAR_LENGTH/$1; #NOTE: clashes with definition below *why it's named inverse.
#Should figure out algorithm that includes some form of fraction in order to deal with part time.
if [[ $1 > 80 ]]
then
 INVERSE_INTERVAL_SIZE=$1/80;
 #NOTE: This may cause issues where up to 80 secounds is unaccounted for so is currently not used.
fi
#TODO: use functions to properly display status bar for now status bar will show seconds/minute

echo Start time 
date
echo 
echo
for (( i=1; i<=$TIME_IN_SECOUNDS; i++ ))
do
 sleep 1;
 printf "\033[F\r"
 printf "\033[F\r"
 for(( j=0; j<i%60; j++))  
  do
  printf "*"
  done
  for(( j=0; j<60-i%60; j++))
  do
  printf "."
  done 
 printf "\n" 
 date
 done
echo Times Up!
date
#TODO:play sound

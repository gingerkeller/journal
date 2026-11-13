#!/bin/bash
if [ $# -eq 0 ] 
then
	echo "Year is empty. Assuming next year."
	year=$(date +%Y)
	declare -i year
	year+=1
else
	year=$1
fi

startdate="$year-01-01"
enddate="$year-12-31"
currentDateTs=$(date -j -f "%Y-%m-%d" $startdate "+%s")
endDateTs=$(date -j -f "%Y-%m-%d" $enddate "+%s")
offset=86400
prevmonth=''
cwdir="Journal_${year}"

mkdir $year

while [ "$currentDateTs" -le "$endDateTs" ]
do
  date=$(date -j -f "%s" $currentDateTs "+%Y-%m-%d")
  month=$(date -j -f "%s" $currentDateTs "+%m")
  mon=$(date -j -f "%s" $currentDateTs "+%B")
  if [[ $month != $prevmonth ]]
  then
  	echo "Creating entries for ${mon} ${year}."
	  cwdir="$year/$year-$month"
	  mkdir $cwdir
  fi
  echo "...Creating entry for ${date}"
  day=$(date -j -f "%s" $currentDateTs "+%d")
  
  dow=$(date -j -f "%s" $currentDateTs "+%A")
  firstline="$day $mon $year $dow\n"
  echo -e $firstline > "${cwdir}/${date}.txt"

  prevmonth=$month
  currentDateTs=$(($currentDateTs+$offset))
done

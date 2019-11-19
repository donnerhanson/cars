#! /bin/bash
# cars.sh
# Donner Hanson

echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit the program";
option="0";

while [ $option -ne 3 ]
do
read -r option;

case $option in 
	1)
	# new car - input individually and store as string YR:MK:MOD
	echo "enter year";
	read -r YR;
	echo "enter make";
	read -r MK;
	echo "enter model";
	read -r MDL;
	DETAILS="$YR:$MK:$MDL";
	# append to file My_old_cars
	echo "$DETAILS" >> My_old_cars; 
	# read info from file My_old_cars
	# sort each line by year
	echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit";
	;;
	2)
	# display list sorted by year
	echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit"; 
	;;
	3)
	#quit and exit
	echo "exiting";
	;;
	*)
	echo "not valid: enter a value in [1, 3]"
	;;
	
esac
done

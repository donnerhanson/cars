#! /bin/bash
# cars.sh
# Donner Hanson

echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit the program:";
option="0";

while [ $option -ne 3 ]
do
read -r option;

case $option in
	1)
	# new car - input individually and store as string YR:MK:MOD
	echo "enter year";
	read -r YR;
	# check to make sure YR is integer only
	while ! [[ ${YR} =~ ^[[:digit:]]+$ ]]
	do
		echo "enter year";
		read -r YR;
	done
	echo "enter make";
	read -r MK;
	echo "enter model";
	read -r MDL;
	DETAILS="$YR:$MK:$MDL";
	# append to file My_old_cars
	echo "$DETAILS" >> My_old_cars;
	# change any delimiting ':' to ' ' and redirect all
	# output from command to null
	# FS is the field separator and OFS is the output field separator
	awk '$1=$1' FS=":" OFS=" " My_old_cars &> /dev/null;
	# sort the list by the first column by numeric value
	# and output to tempFile.txt
	sort -nk1 My_old_cars > tempFile.txt;
	# rename tempFile as My_old_cars
	mv tempFile.txt My_old_cars;
	# replace delimiting ':' in place of ' ' and redirect all command
	# output to null
	awk '$1=$1' FS=" " OFS=":" My_old_cars &> /dev/null;
	echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit:";
	;;
	2)
	# display previously sorted file
	cat My_old_cars;
	echo "enter 1 to enter a new car, 2 to display list of cars (sorted by year), or 3 to quit:";
	;;
	3)
	#quit and exit
	echo "Goodbye";
	;;
	*)
	echo "not valid: enter a value in [1, 3]:"
	;;

esac
done

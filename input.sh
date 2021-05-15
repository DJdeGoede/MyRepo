#!/usr/bin/env bash

echo -n "What is your name? "; read name
echo -n "What is your password? "; read -s pass; echo
read -p "What is your favorite animal? " animal

echo "name: $name, pass: $pass, animal: $animal"

echo -e "\nWhich animal"
select animal in "cat" "dog" "quit"
do
	case $animal in
		cat) echo "Cats like to sleep.";;
		dog) echo "Dogs like to play catch.";;
		quit) break;;
		*) echo "Please choose a valid option.";;
	esac
done

read -ep "Favourite colour? " -i "Blue" favcolour
echo $favcolour

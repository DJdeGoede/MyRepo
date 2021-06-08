#!/usr/bin/env bash

echo -n "What is your name? "; read name
echo -n "What is your password? "; read -s pass; echo
read -p "What is your favorite animal? " animal

echo "name: $name, pass: $pass, animal: $animal"

#echo -e "\nWhich animal"
PS3="Which animal: "
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

# force answer
read -ep "Favourite food? " favfood
while [[ -z $favfood ]]; do
	read -ep "Favourite food? " favfood
done

echo "Favourite food chosen: $favfood."

# if not supplied provide default answer
read -ep "Favourite movie? [Shutter Island]? " favmovie
while [[ -z $favmovie ]]; do
	# if not specified give a default answer
	favmovie="Shutter Island"
done

echo "Favourite movie chosen: $favmovie."

PS3='Please enter your choice: '
options=("Option 1" "Option 2" "Option 3" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "you chose choice 1"
            ;;
        "Option 2")
            echo "you chose choice 2"
            ;;
        "Option 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

read -p "What year? [nnnn] " year
	until [[ $year =~ [0-9]{4} ]]; do
		read -p "What year [nnnn] " year
	done
	echo "Selected year: $year"

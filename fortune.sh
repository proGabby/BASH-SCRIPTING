#!/bin/bash

# Program to tell a persons fortune

echo -e "\n~~ Fortune Teller ~~\n"

#declaring an array
RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))

# declaring a function
GET_FORTUNE(){
  if [[ ! $1 ]]
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:
  fi
  read QUESTION
}

# calling a function with argument
GET_FORTUNE

# a do-until loop
until [[ $QUESTION =~ \?$ ]]
do
    #calling a function with argument
  GET_FORTUNE again
done

#calling a particle item in the array using an index
# in this instance, the 1 produce by the random number variable
echo -e "\n${RESPONSES[$N]}"
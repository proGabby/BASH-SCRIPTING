#!/bin/bash

# Program that counts down to zero from a given argument

echo -e "\n~~ Countdown Timer ~~\n"

if [[ $1 -gt 0 ]]
then
    #muti-line comment
  : '
  a for loop
  for (( i = $1; i >= 0; i-- ))
  do
    echo $i
    sleep 1
  done
  '
    # declaring a variable in bash
  I=$1

    # a while loop
  while [[ $I -ge 0 ]]
  do
    echo $I
    (( I-- ))
    #sleep make the program sleep for the specified time in seconds
    sleep 1
  done
else
  echo Include a positive integer as the first argument.
fi
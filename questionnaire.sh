#!/bin/bash

echo -e "\n~~ Questionnaire ~~\n"
# declaring variables
QUESTION1="What's your name?"
QUESTION2="Where are you from?"
QUESTION3="What's your favorite coding website?"

echo $QUESTION1
#reading input from user and saving it in a variable
read NAME

echo $QUESTION2
read LOCATION

echo $QUESTION3
read WEBSITE

echo -e "\nHello $NAME from $LOCATION. I learned that your favorite coding website is $WEBSITE!"

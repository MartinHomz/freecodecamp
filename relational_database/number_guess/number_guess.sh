#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "Enter your username:"
read NAME

USER_INFO=$($PSQL "SELECT * FROM users WHERE username='$NAME';")

if [[ -z $USER_INFO ]]
then
  # new user
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$NAME');")
  echo -e "\nWelcome, $NAME! It looks like this is your first time here."
else
  # already existing user
  echo $USER_INFO | while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    echo $USER_ID
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

RANDOM_NUMBER=$(( ( RANDOM % 1000 )  + 1 ))
USER_NUMBER=0
ROUND=0
echo -e "\nGuess the secret number between 1 and 1000:"
while [[ $RANDOM_NUMBER -ne $USER_NUMBER ]]
do
  read USER_NUMBER
  while [[ ! $USER_NUMBER =~ ^[0-9]+$ ]] 
  do
    echo -e "\nThat is not an integer, guess again:"
    read USER_NUMBER
  done

  if [[ $RANDOM_NUMBER -gt $USER_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  elif [[ $RANDOM_NUMBER -lt $USER_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  fi

  ((ROUND++))
done

USER_INFO_TO_UPDATE=$($PSQL "SELECT * FROM users WHERE username='$NAME'")
echo "$USER_INFO_TO_UPDATE" | while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
do
  if [[ -z $BEST_GAME || BEST_GAME -gt $ROUND ]]
  then
    NEW_BEST_GAME=$ROUND
  else
    NEW_BEST_GAME=$BEST_GAME
  fi
  UPDATE_USER_RESULT=$($PSQL "UPDATE users SET best_game=$NEW_BEST_GAME, games_played=$(($GAMES_PLAYED + 1)) WHERE user_id=$USER_ID")
done

echo -e "\nYou guessed it in $ROUND tries. The secret number was $RANDOM_NUMBER. Nice job!"

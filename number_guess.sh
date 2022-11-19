#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\n~~Welcome to the number guess game!~~\n"
#USERNAME MANAGEMENT
echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name = '$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, "$USERNAME"! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(user_name) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id = $USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id = $USER_ID")
  echo "Welcome back, "$USERNAME"! You have played "$GAMES_PLAYED" games, and your best game took "$BEST_GAME" guesses."
fi

# GAME START
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

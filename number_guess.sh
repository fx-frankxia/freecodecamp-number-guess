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

# GAME GUESS LOOP
GUESS_LOOP(){
  read USER_GUESS
  if [[ $USER_GUESS =~ ^[0-9]{1,4}$ ]]
  then
    ((NUMBER_OF_GUESSES++))
    if [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      GUESS_LOOP
    else
      if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
        GUESS_LOOP
      else
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        if [[ -z $BEST_GAME ]]
        then
          UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = '$NUMBER_OF_GUESSES' WHERE user_name = '$USERNAME'")
        else
          if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
          then
            UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = '$NUMBER_OF_GUESSES' WHERE user_name = '$USERNAME'")            
          fi
        fi
      fi
    fi   
  else
    echo "That is not an integer, guess again:"
    GUESS_LOOP
  fi
}

# GAME START
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
echo -e "\nGuess the secret number between 1 and 1000:\n"
NUMBER_OF_GUESSES=0
GUESS_LOOP
((GAMES_PLAYED++))
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = '$GAMES_PLAYED' WHERE user_name = '$USERNAME'")

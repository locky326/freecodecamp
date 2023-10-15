#!/bin/bash

Default_Start_Best_Score=1000

Setup_SQL(){
  PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
  Usernames_Exists_Check=$($PSQL "SELECT to_regclass('usernames');")

  if [[ -z $Usernames_Exists_Check ]]
  then
    Create_Usernames_Schema=$($PSQL "CREATE TABLE usernames (user_id SERIAL, username VARCHAR(23) UNIQUE, games_played INT DEFAULT 1, best_game INT DEFAULT $Default_Start_Best_Score);")
  fi # End of 'if [[ -z $Usernames_Exists_Check ]]'
} # End of 'Setup_SQL(){'

Setup_username(){
  # if username is blank or just numbers, re-start game
  if [[ -z $1 || $1 =~ ^[0-9]+ ]]
  # if [[ -z $1 ]]
  then
    Main_Func "Please enter a username starting with a letter"
  fi # End of 'if [[ -z $1 || $1 =~ ^[0-9]+ ]]'

  # if username exists
  Check_Username_Exists=$($PSQL "SELECT exists (SELECT 1 FROM usernames WHERE username = '$1' LIMIT 1);")
  # echo $Check_Username_Exists # This is 'f' or 't'

  if [[ "$Check_Username_Exists" == "f" ]]
  then
    username=$1

    # Print output
    echo Welcome, $1! It looks like this is your first time here.
    
    # Insert username into database
    Insert_Username=$($PSQL "INSERT INTO usernames(username) VALUES('$username');")
  else
    username=$($PSQL "SELECT username FROM usernames WHERE username='$1';")

    # Get 'games_played'
    games_played=$($PSQL "SELECT games_played FROM usernames WHERE username='$username';")

    # Get 'best_game'
    best_game=$($PSQL "SELECT best_game FROM usernames WHERE username='$username';")

    # Update 'games_played'
    # temp_new_games_played=$games_played+1
    update_games_played=$($PSQL "UPDATE usernames SET games_played=$games_played WHERE username='$username';")

    # Print output
    echo Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses.
  fi # End of 'if [[ "$Check_Username_Exists" == "f" ]]'
} # End of 'Setup_username(){'

Play_Game(){
  echo Guess the secret number between 1 and 1000:
  secret_number=$(( $RANDOM % 1000 + 1 ))
  # echo Secret: $secret_number
  number_of_guesses=0

  # increment 'games_played' in table 'usernames'
  new_games_played=$(($2+1))
  increment_games_played=$($PSQL "UPDATE usernames SET games_played=$new_games_played;")
  # echo increment_games_played: $increment_games_played

  while_runner=0
  while [ $while_runner -eq 0 ]
  do
    read number_guess

    if [[ -z $number_guess || ! $number_guess =~ ^[0-9]+$ ]]
    then
      echo That is not an integer, guess again:
    else
      if [[ $number_guess -gt $secret_number ]]
      then 
        echo It\'s lower than that, guess again:
        number_of_guesses=$((number_of_guesses+1))
      fi # End of 'if [[ $number_guess -gt $secret_number ]]'

      if [[ $number_guess -lt $secret_number ]]
      then 
        echo It\'s higher than that, guess again:
        number_of_guesses=$((number_of_guesses+1))
      fi # End of 'if [[ $number_guess -gt $secret_number ]]'

      if [[ $number_guess -eq $secret_number ]]
      then
        number_of_guesses=$((number_of_guesses+1))
        echo You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!
                
        # update 'best_game' in table 'usernames' if needed
        if [[ $3 -gt $number_of_guesses ]]
        then
          update_best_game=$($PSQL "UPDATE usernames SET best_game=$number_of_guesses")
          # echo update_best_game: $update_best_game
        fi # End of 'if [[ $3 -gt $number_of_guesses ]]'
        
        while_runner=1
      fi # End of 'if [[ $number_guess -eq $secret_number ]]'
    fi # End of 'if [[ -z $number_guess || ! $number_guess =~ ^[0-9]+$ ]]'
  done # End of 'while [ $while_runner=='t' ]'

  # echo $temp_guess
} # End of 'Play_Game(){'

Main_Func(){
  # When input is provided
  if [[ $1 ]]
  then
    echo $1
  fi # End of 'if [[ $1 ]]'

  # Setup_SQL
  Setup_SQL

  # Enter username
  echo "Enter your username:"
  read temp_username_entered

  # Setup_username
  Setup_username $temp_username_entered

  # Get username_game
  username_game=$($PSQL "SELECT username from usernames WHERE username='$temp_username_entered'")
  
  # Get username_games_played
  username_games_played=$($PSQL "SELECT games_played from usernames WHERE username='$temp_username_entered'")

  # Get username_best_game
  username_best_game=$($PSQL "SELECT best_game from usernames WHERE username='$temp_username_entered'")

  # Play_Game
  Play_Game $username_game $username_games_played $username_best_game
} # End of 'Main_Func(){'

Main_Func

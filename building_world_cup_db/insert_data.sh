#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRU

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERS_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner ]]
  then
    INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
     if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into teams, $WINNER"
    else
      echo "alrady done"
    fi
  fi

  if [[ $OPPONENT != opponent ]]
  then
    INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into teams, $OPPONENT"
    else
      echo "alrady done"
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERS_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != winner && $OPPONENT != opponent ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR, '$ROUND', $WINNERS_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)")
    if [[ INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into games, $WINNER vs $OPPONENT"
    fi
  fi

done
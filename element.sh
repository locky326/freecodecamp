#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"


SYMBOL() {
  echo -e "\nSymbol\n"
}

AR_NAME() {
  echo -e "\nName\n"
}

if [[ $# == 0 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # show element name from number
    AtNu=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$1'")
    if [[ -z $AtNu ]]
    then
      echo 'I could not find that element in the database.'
    else
      #echo 'number'
      AtName=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$AtNu'")
      AtSy=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$AtNu'")
      AtWe=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$AtNu'")
      AtMe=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
      AtBo=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
      AtTy=$($PSQL "SELECT type FROM properties FULL JOIN types ON properties.type_id = types.type_id where atomic_number='$AtNu'")
      echo "The element with atomic number $AtNu is $AtName ($AtSy). It's a $AtTy, with a mass of $AtWe amu. $AtName has a melting point of $AtMe celsius and a boiling point of $AtBo celsius."
    fi
    
  else 
    le=`expr length "$1"`
    if [ $le -le 2 ]
    then
      # show element name from number
      AtNu=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
      if [[ -z $AtNu ]]
      then
        echo 'I could not find that element in the database.'
      else
        #echo 'symbol'
        AtName=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$AtNu'")
        AtSy=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$AtNu'")
        AtWe=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$AtNu'")
        AtMe=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
        AtBo=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
        AtTy=$($PSQL "SELECT type FROM properties FULL JOIN types ON properties.type_id = types.type_id where atomic_number='$AtNu'")
        echo "The element with atomic number $AtNu is $AtName ($AtSy). It's a $AtTy, with a mass of $AtWe amu. $AtName has a melting point of $AtMe celsius and a boiling point of $AtBo celsius."
    
      fi

    else
      # show element name from element name
      AtNu=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
      if [[ -z $AtNu ]]
      then
        echo 'I could not find that element in the database.'
      else
        #echo 'name'
        AtName=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$AtNu'")
        AtSy=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$AtNu'")
        AtWe=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$AtNu'")
        AtMe=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
        AtBo=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$AtNu'")
        AtTy=$($PSQL "SELECT type FROM properties FULL JOIN types ON properties.type_id = types.type_id where atomic_number='$AtNu'")
        echo "The element with atomic number $AtNu is $AtName ($AtSy). It's a $AtTy, with a mass of $AtWe amu. $AtName has a melting point of $AtMe celsius and a boiling point of $AtBo celsius."
    
      fi
    fi
  fi
fi



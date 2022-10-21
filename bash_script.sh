#!/bin/bash
echo "Using the shell at this path $SHELL"

# This script evaluates user's weightlifting prowess based on their gender, bodyweight, and total

# Prompts for bodyweight and validates input
while [ -z "$USER_BW" ] || ! [[ "$USER_BW" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
do
    read -p 'What is your bodyweight in kilograms? ' USER_BW
    if [ -z "$USER_BW" ]; then 
    echo 'Input cannot be blank, please try again!' 
    elif ! [[ "$USER_BW" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
    echo 'Please enter only an integer!'
    fi 
done

# Prompts for weightlifting total and validates input
while [ -z "$USER_TOTAL" ] || ! [[ "$USER_TOTAL" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]
do
    read -p 'What is your best weightlifting total in kilograms? ' USER_TOTAL
    if [ -z "$USER_TOTAL" ]; then 
    echo 'Input cannot be blank, please try again!' 
    elif ! [[ "$USER_TOTAL" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]]; then
    echo 'Please enter only an integer!'
    fi 
done

# Calculate total to BW ratio as an incredibly rough estimate of prowess
USER_RATIO=$((10**4 * $USER_TOTAL/$USER_BW))

# Displays users information
echo "You compete as a ${USER_BW}kg and total ${USER_TOTAL}kg;"

# Checks for competetiveness of lifter's ratios and responds accordingly
if [ "$USER_RATIO" -ge 0 ] && [ "$USER_RATIO" -le 24000 ]; then
  echo "You are not quite a regionally competetive lifter yet."
elif [ "$USER_RATIO" -ge 24000 ] && [ "$USER_RATIO" -le 29000 ]; then
  echo "You are competetive at the regional level, but not quite qualified for the American Open Finals."
elif [ "$USER_RATIO" -ge 29000 ] && [ "$USER_RATIO" -le 32000 ]; then
  echo "You are qualified for the American Open Finals, but not quite at the National Championships level."
elif [ "$USER_RATIO" -ge 32000 ] && [ "$USER_RATIO" -le 35000 ]; then
  echo "You are competetive at the national level and likely one of the top 15 in the country!"
else
  echo "You are likely one of the best in the nation at weightlifting."
fi
$SHELL

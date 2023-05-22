#!/bin/bash

COOKIE_FILE=".session_cookie"

# Check if the day argument is provided
if [ -z "$1" ]; then
	echo "Please provide the day as an argument."
	exit 1
fi

# Read the session cookie from file if available
if [ -f "$COOKIE_FILE" ]; then
	session_cookie=$(cat "$COOKIE_FILE")
else
	# Prompt for session cookie if the file doesn't exist
	read -p "Enter your session cookie: " session_cookie
	# Save session cookie to file for future use
	echo "$session_cookie" >"$COOKIE_FILE"
fi

# Validate the session cookie
response=$(curl -s -o /dev/null -w "%{http_code}" "https://adventofcode.com/2022/day/$1/input" --cookie "session=$session_cookie")

if [ "$response" == "200" ]; then
	# Successful response, fetch the input and redirect to file
	curl "https://adventofcode.com/2022/day/$1/input" --cookie "session=$session_cookie" >"$1.in"
	echo "Input saved to $1.in"
elif [ "$response" == "400" ]; then
	# Invalid day or session cookie
	echo "Invalid day or session cookie. Please check your input and try again."
	# Clear the session cookie file if it exists
	if [ -f "$COOKIE_FILE" ]; then
		rm "$COOKIE_FILE"
	fi
	exit 1
else
	# Other errors
	echo "An error occurred while fetching the input. HTTP response code: $response"
	exit 1
fi

#!/usr/bin/env bash

# TODO 1: Check if we have at least 1 argument
if [ $# -lt 1 ]; then
   echo "Usage: $0 <name> [age]"
   exit 1
fi

# TODO 2 & 3: Grab the arguments (with defualt for the second)
NAME="$1"
AGE="${2:-unknown}"

# TODO 4: Print the Greeting
echo "Hello ${NAME}, age: ${AGE}"


#!/bin/bash

# Variables

me=$(whoami)
euid=$(euid)
time=$(date +%T)
date=$(date +%F)
greethour=$(date +%k) # Used to determine the greeting to the user

# Conditional Variables

if [ $greethour = {0,1,2,3,4,5,6,7,8,9,10,11} ]; then
  greeting=morning
elif [ $greethour = 12,13,14,15,16,17,18,19,20,21,22,23} ]; then
  greeting=afternoon
else
  return 1
fi
if [ $? = 1 ]; then
  fullgreeting="Hello, "$me"!"
  # Line 21 should not happen unless the loop at line 13-19 failed to catch a valid hour (indicated by line 18)
else
  fullgreeting="Good "$greeting", "$me"!"
fi

# Functions

function menufunc();
{
  echo $fullgreeting
  echo "Today is "$date"."
  echo "The time is "$time"."
  echo 
}
function sourceconf();
{
  # 

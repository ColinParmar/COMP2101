#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
user="colin"
hostname=$(hostname)
title=$(date +%A)
time=$(date +"%H:%M")
echo "It is $title at $time"

test "$title" = "Monday" && title="It is workday1"
test "$title" = "Tuesday" && title="It is workday2"
test "$title" = "Wednesday" && title="It is workday3"
test "$title" = "Thursday" && title="It is workday4"
test "$title" = "Friday" && title="It is workday5"
test "$title" = "Saturday" && title="It is partyday1"
test "$title" = "Sunday" && title="It is partyday2"
###############
# Main        #
###############
cat <<EOF

Welcome to planet $hostname, "$title $user!"

EOF

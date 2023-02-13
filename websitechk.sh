#!/bin/bash

# Log file path
log_file="/path/to/website_status.log"

# Counter to keep track of the number of checks
counter=0

while [ $counter -lt 5 ]
do
    # Check the HTTP status code of the website
    status_code=$(curl -s -o /dev/null -w "%{http_code}" <WEBSITE URL>)

    # Check if the status code is 200 (OK)
    if [ $status_code -eq 200 ]
    then
        message="$(date): Website is up and running!"
        echo $message
    else
        message="$(date): Website is down! (Status code: $status_code)"
        echo $message
    fi

    # Append the message to the log file
    echo $message >> $log_file

    # Increment the counter
    counter=$((counter + 1))

    # Wait for 5 minutes
    sleep 300
done

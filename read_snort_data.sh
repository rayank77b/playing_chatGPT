#!/bin/bash
# created by chatGPT3
#
# create a bash script which read intrusion data from snort 
# mysql database and print it timeline out.

# Define MySQL connection details
MYSQL_USER="username"
MYSQL_PASSWORD="password"
MYSQL_HOST="localhost"
MYSQL_DATABASE="snort"

# Define query to get intrusion data
QUERY="SELECT timestamp, sig_name, ip_src, ip_dst FROM event WHERE signature_id != 0 ORDER BY timestamp ASC"

# Execute query and process results
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -D "$MYSQL_DATABASE" -e "$QUERY" | while read -r timestamp sig_name ip_src ip_dst; do
  # Print timestamp in a human-readable format
  timestamp=$(date -d "@$timestamp" "+%Y-%m-%d %H:%M:%S")

  # Print intrusion data in timeline format
  echo "$timestamp - $sig_name - $ip_src -> $ip_dst"
done

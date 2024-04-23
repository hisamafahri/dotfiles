#!/bin/bash
# Send encrypted email
# Requires gpg and mail to be setup
echo "Available keys:"
gpg --list-keys

# Gather variables
echo "Enter public key of recipient:"
read -e user

echo "Enter email:"
read -e email

echo "Enter subject:"
read -e subject

echo "Enter message:"
read message

# Pipe the echoed message to gpg, sign and encrypt it to ascii (-eas), include your key so you can read it,
# include recipients key, pipe to mail with the (unencrypted) subject, send to the given email.
# echo "$message" | gpg2 --no-emit-version -eas -r hisam@gmail.com -r $user | mail -s "$subject" $email

# Generate a timestamp for the filename
timestamp=$(date +%Y%m%d%H%M%S)
filename="output_${timestamp}.gpg"

echo "$message" | gpg2 --no-emit-version -eas -r hisam@gmail.com -r $user > "$filename"

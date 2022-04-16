# README

Simple API to create or delete users only:
- POST /user
- DELETE /user
 User has a first name and last name, birthday date and location (locations could be in any
format of your choice)
 The system needs to send the following message at 9am on users’ local time via call to
https://hookbin.com endpoint (create a new one for yourself): “Hey, {full_name} it’s your
birthday”
 The system needs to be able to recover and send all unsent messages if the service was
down for a period of time (say a day).

# User

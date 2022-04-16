# README

## User
  User has `first_name`, `last_name`, `birthday_date` and `location`. Location of the user is using ActiveSupport::TimeZone location format. If the location inputted at the time of user creation request doesn't have any matching value from ActiveSupport::TimeZone, the response would have status `422` and will return list of supported location format.

## Notification
  Storing all notification(message) to cater future messages

## How it Works
Everyday at 1am, the scheduler (using `whenever` gem) will run the `prepare_birthday_message` method from User model. In that method, there will be a query listing all user having birthday at the next day (Not at the same day to make sure there are no time zone difference problem). If there are no user listed, then the scheduler is completed. If there are some user, then the method will enqueue a job to the `send_message_job` that will run by tomorrow at 9 in user local time.

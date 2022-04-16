class User < ApplicationRecord

  def self.prepare_birthday_message
    users = User.where("strftime('%m%d', birthday_date) = ?", DateTime.tomorrow.strftime("%m%d"))
    notification = Notification.find_by(name: "birthday")
    tomorrow = DateTime.tomorrow
    if !users.empty?
      users.each do |user|
        hash = {full_name: "#{user.first_name} #{user.last_name}"}
        message = notification.message % hash
        time = Time.new(tomorrow.year, tomorrow.month, tomorrow.day,9,0,0).strftime("%F %T.%N").in_time_zone(user.location)
        Delayed::Job.enqueue(SendMessageJob.set(wait_until: time).perform_later(user, message))
      end
    end
  end
  
end

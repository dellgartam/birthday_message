class User < ApplicationRecord

  def self.prepare_birthday_message
    users = User.where("strftime('%m%d', birthday_date) = ?", DateTime.tomorrow.strftime("%m%d"))
    p "cron job runs successfully"
    tomorrow = DateTime.tomorrow
    if !users.empty?
      users.each do |user|
        time = Time.new(tomorrow.year, tomorrow.month, tomorrow.day,9,0,0).strftime("%F %T.%N").in_time_zone(user.location)
        Delayed::Job.enqueue(SendMessageJob.new(user), run_at: time)
      end
    end
  end
  
end

class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(user, message)
    Hookbin::SendMessage.create(user, message)
  end
end

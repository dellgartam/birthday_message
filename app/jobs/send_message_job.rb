class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(user)
    Hookbin::SendMessage.create(user)
  end
end

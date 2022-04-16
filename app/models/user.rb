class User < ApplicationRecord

  def send_message
    
    Pipedream::Send.create(self)
    
  end
  
end

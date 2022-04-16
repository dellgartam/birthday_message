class User < ApplicationRecord

  def send_message
    
    Hookbin::Send.create(self)
    
  end
  
end

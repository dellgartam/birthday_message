require 'net/http'
require 'uri'

module Hookbin
  class SendMessage
    def self.create(user, message)
      uri = URI('https://hookb.in/r1aDoYjnnViqk2XXBVeX')

      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')

      res = Net::HTTP.post_form(uri, "message"=> message)
    end
  end
end
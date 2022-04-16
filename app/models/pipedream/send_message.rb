require 'net/http'
require 'uri'

module Pipedream
  class SendMessage
    def self.create(user)
      uri = URI('https://hookb.in/r1aDoYjnnViqk2XXBVeX')

      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')

      req.body = {
          name: 'John'
      }.to_json
      res = Net::HTTP.post_form(uri, "message"=>"Happy birthday #{user.first_name} #{user.last_name}")
    end
  end
end
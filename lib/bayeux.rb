require 'json'
require 'net/http'
require 'uri'

module Bayeux
  ENDPOINT = URI.parse('http://localhost:4567/faye')

  def self.publish(channel, data)
    message = {'channel' => channel, 'data' => data.to_hash}
    Net::HTTP.post_form(ENDPOINT, :message => JSON.unparse(message))
  end
end

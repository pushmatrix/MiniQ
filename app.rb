require 'sinatra'
require 'faye'

use Faye::RackAdapter, :mount => '/faye', :timeout => 25
@@id = 0

get '/' do
  erb :index
end

def publish(channel, msg)
  env['faye.client'].publish(channel, msg)
end

get '/join' do
  @@id += 1
  publish('/caller/join', { :id => @@id, :number => '6132768334', :createdAt => Time.now.to_i })
  "JOINED"
end

get '/leave' do
  publish('/caller/leave', params[:number])
  "LEFT"
end
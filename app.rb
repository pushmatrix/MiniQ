require 'sinatra'
require 'faye'

use Faye::RackAdapter, :mount => '/faye', :timeout => 25

get '/' do
  erb :index
end

get '/queue/:id' do
  @queue_name = params[:id]
  erb :queue
end

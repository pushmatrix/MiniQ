require 'sinatra'
require 'faye'

use Faye::RackAdapter, :mount => '/faye', :timeout => 25

get '/' do
  erb :index
end
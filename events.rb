require 'bayeux'

events.asterisk.manager_interface.each do |event|
  case event.name
  when 'Join'
    Bayeux.publish('/caller/join', { :id => event.headers['Channel'], 
                                     :number => event.headers['CallerIDNum'],
                                     :joinedAt => Time.now.to_i })
  when 'Leave'
    Bayeux.publish('/caller/leave', { :id => event.headers['Channel'] })
  end
end

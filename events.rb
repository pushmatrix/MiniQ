require 'bayeux'

events.asterisk.manager_interface.each do |event|
  case event.name
  when 'Join'
    Bayeux.publish('/caller/join', { :id => headers['Channel'], 
                                     :number => headers['CallerID'],
                                     :joined_at => Time.now.to_i })
  when 'Leave'
    Bayeux.publish('/caller/leave', { :id => headers['Channel'] })
  end
end
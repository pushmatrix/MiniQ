require 'bayeux'

events.asterisk.manager_interface.each do |event|
  ahn_log.events "#{event.name} - - #{event.inspect}"
  case event.name
  when 'Join'
    Bayeux.publish('/caller/join', { :id => event.headers['Channel'], 
                                     :number => event.headers['CallerIDNum'],
                                     :joinedAt => Time.now.to_i })

    Bayeux.publish("/#{event.headers['Queue']}/join", { :id => event.headers['Channel'],
                                     :number => event.headers['CallerIDNum'],
                                     :joinedAt => Time.now.to_i })
  when 'Leave'
    Bayeux.publish('/caller/leave', { :id => event.headers['Channel'] })

    Bayeux.publish("/#{event.headers['Queue']}/leave", { :id => event.headers['Channel'] })
  end
end

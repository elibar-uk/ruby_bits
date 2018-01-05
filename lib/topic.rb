require 'bunny'

connection = Bunny.new.start
channel = connection.create_channel

exchange = channel.topic("news", :auto_delete => true)

channel.queue("", :exclusive => true).bind(exchange, :routing_key => ".world.politics.#").
  subscribe do |info, metadata, payload|
    puts "something about politics, #{payload}, routing_key => #{info.routing_key}"
end

channel.queue("", :exclusive => true).bind(exchange, :routing_key => "#.internetgovernance.cybercrime").
  subscribe do |info, metadata, payload|
    puts "something about governance, #{payload}, routing_key => #{info.routing_key}"
end


channel.queue("", :exclusive => true).bind(exchange, :routing_key => "world.politics.internetgovernance.*").
  subscribe do |info, metadata, payload|
    puts "something about politics and governance, #{payload}, routing_key => #{info.routing_key}"
end

exchange.publish("Havos", :routing_key => "world.politics.someother.nonrelatedtopic")

exchange.publish("People relevant to copyright", :routing_key => "global.ambassadorship.internetgovernance.cybercrime")

exchange.publish("Confusion of lifter", :routing_key => "world.politics.internetgovernance.netplay")

sleep 1

connection.close

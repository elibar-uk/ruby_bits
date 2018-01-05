require 'bunny'

con = Bunny.new.start
channel = con.create_channel

queue1 = channel.queue("postoffice.mick", :auto_delete => true)
queue2 = channel.queue("postoffice.roni", :auto_delete =>  true)
queue3 = channel.queue("postoffice.ian", :auto_delete => true)

exchange = channel.default_exchange

queue1.subscribe do |info, metadata, payload |
  puts "mike's box recieved, #{payload}"
end

queue2.subscribe do |info, metadata, payload |
  puts "roni's box recieved, #{payload}"
end

queue3.subscribe do |info, metadata, payload |
  puts "ian's box recieved, #{payload}"
end

exchange.publish("i like big views", :routing_key => "postoffice.ian")
.publish("i like making apps", :routing_key => "postoffice.roni")
.publish("I like something else", :routing_key => "postoffice.mick")

sleep 1.0

con.close

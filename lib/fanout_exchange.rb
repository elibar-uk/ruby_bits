require 'bunny'

connection = Bunny.new.start

channel = connection.create_channel
exchange = channel.fanout("surf.swells")

channel.queue("ian", :auto_delete => true).bind(exchange).subscribe do | info, matadata, payload|

  puts "#{payload} => ian"
end

channel.queue("roni", :auto_delete => true).bind(exchange).subscribe do | info, matadata, payload|

  puts "#{payload} => roni"
end

channel.queue("mike", :auto_delete => true).bind(exchange).subscribe do | info, matadata, payload|

  puts "#{payload} => mike"
end

exchange.publish("lower thens, perfect hight")
.publish("ocean beach, balbla")

sleep 1.0

connection.close

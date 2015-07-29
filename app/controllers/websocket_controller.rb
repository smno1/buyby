class WebsocketController < WebsocketRails::BaseController
	def client_connected
		#WebsocketRails.users[current_user.channel] = connection
		puts "================================="
		puts "websocket connection connected"
		puts "#{current_user.nickname}: #{connection}"
		puts "all connection #{WebsocketRails.users.each {|x| puts x}}"
		puts "================================="
	end

	def client_disconnected
		known_connections = WebsocketRails.users[current_user.channel]
		puts "================================="
		puts "websocket connection disconnected"
		puts "all connection #{WebsocketRails.users.each {|x| puts x}}"
		puts "================================="
		known_connections.connections.delete connection
	end
end

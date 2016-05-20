require "telegram/bot"

token = "215010612:AAHAA5cQqubietorU46MG2Tx4pxkT_ECjTM"
Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		case message.text
		when "/start" then bot.api.send_message(chat_id: message.chat.id, text: "Bienvenido al bot de pruebad de Adrian \n Los comandos son: \n" + 
				"/start : Mensaje de bienvenida\n /saludo : El bot te manda un saludo\n /stop : El bot se despide de ti")
		when "/saludo" then bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name}!")
		when "/stop" then bot.api.send_message(chat_id: message.chat.id, text: "Adios, #{message.from.first_name}")
		else
			bot.api.send_message(chat_id: message.chat_id, text: "#{message.from.first_name}, no se que significa el comando: #{message.text}") 
		end
	end
end
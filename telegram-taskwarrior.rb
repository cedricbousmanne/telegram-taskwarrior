require 'telegram/bot'

token = ENV['TELEGRAM_BOT_API_TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/task due'
      text = `task due`
      bot.api.send_message(chat_id: message.chat.id, text: text)
    when '/info'
      bot.api.send_message(chat_id: message.chat.id, text: message.chat.id)
    end
  end
end

require 'telegram/bot'

token = ENV['TELEGRAM_BOT_API_TOKEN']
chat_id = ENV['TELEGRAM_CHAT_ID']

Telegram::Bot::Client.run(token) do |bot|
  text = `task export next | jq ".[]" | jq ."description"`
  text = text.split("\n").map{|line| "* "+line[1..-2]}.join("\n")
  bot.api.send_message(chat_id: chat_id, text: text)
end

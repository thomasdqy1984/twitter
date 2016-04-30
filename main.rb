require 'Twitter'

puts "Greetings, World!"
puts "Checkpoint 1"

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "26OEaP2P81tb9nxbttp1FPRwi"
  config.consumer_secret     = "4Cto7USB9jjoMw9oLiMQm1oLusd2ZsqTzurBnMUooEsNXfUMrh"
  config.access_token        = "473043430-tT6GX1Wt3WgLfpn5XCiIloLSDiZCFzZw6inkkVCn"
  config.access_token_secret = "5O6kGkLI1rf4TYlvH3npeu2TOWNyLa7wbCYYkncvFfpFx"
end

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

oFile = File.new("output.csv", "w")
if oFile
   puts "File Open"
   client.search("#CAHSRA -filter:retweets", result_type: "mixed", count: "100").collect do |tweet|
   oFile.syswrite("#{tweet.user.screen_name}, #{tweet.text}, #{tweet.retweet_count}\n")
   end
end
oFile.close
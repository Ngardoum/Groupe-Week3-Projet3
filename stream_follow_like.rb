require 'twitter'

# Configuration du client Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
end

streaming_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
end

# Fonction pour liker et suivre
def like_and_follow(client, tweet)
  client.favorite(tweet)
  puts "Liked tweet from @#{tweet.user.screen_name}: #{tweet.text}"
  client.follow(tweet.user)
  puts "Followed @#{tweet.user.screen_name}"
end

# Stream pour écouter les tweets en temps réel
streaming_client.filter(track: "#hello_world") do |object|
  if object.is_a?(Twitter::Tweet)
    like_and_follow(client, object)
  end
end

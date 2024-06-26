require 'twitter'

# Configuration du client Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
end

# Rechercher les 25 derniers tweets avec le hashtag #hello_world
tweets = client.search("#hello_world", result_type: "recent").take(25)

# Liker chaque tweet trouvé
tweets.each do |tweet|
  begin
    client.favorite(tweet)
    puts "Liked tweet from @#{tweet.user.screen_name}: #{tweet.text}"
  rescue Twitter::Error::AlreadyFavorited
    puts "Already liked tweet from @#{tweet.user.screen_name}: #{tweet.text}"
  rescue Twitter::Error => e
    puts "Error liking tweet from @#{tweet.user.screen_name}: #{e.message}"
  end
end

require 'twitter'

# Configuration du client Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'YOUR_CONSUMER_KEY'
  config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
  config.access_token        = 'YOUR_ACCESS_TOKEN'
  config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
end

# Rechercher les 20 derniers tweets avec le hashtag #hello_world
tweets = client.search("#hello_world", result_type: "recent").take(20)

# Suivre chaque utilisateur trouvé
tweets.each do |tweet|
  begin
    client.follow(tweet.user)
    puts "Followed @#{tweet.user.screen_name}"
  rescue Twitter::Error::AlreadyFollowed
    puts "Already following @#{tweet.user.screen_name}"
  rescue Twitter::Error => e
    puts "Error following @#{tweet.user.screen_name}: #{e.message}"
  end
end

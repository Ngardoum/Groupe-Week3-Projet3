require 'twitter'

# Configuration du client Twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'MrMSw7xYRxgrfJxOomkRsQVUj'
  config.consumer_secret     = 'fDpV12K1h5X8RUO9ByOQlMxO8horNzdGM8mBQsVtt34pBMzXtR'
  config.access_token        = '1803439297300754432-3yQdI5QMiVd4wOV0RWhZBFDVCf0iRo'
  config.access_token_secret = 'SeT7vBT0upIXPcCbNEfXytJ6vesx5eJ6mBjsEgEuu5ogk'
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

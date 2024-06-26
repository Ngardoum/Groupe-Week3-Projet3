# spec/twitter_client_spec.rb
require 'rspec'
require 'webmock/rspec'
require 'twitter'

# Méthode de connexion
def twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'MrMSw7xYRxgrfJxOomkRsQVUj'
    config.consumer_secret     = 'fDpV12K1h5X8RUO9ByOQlMxO8horNzdGM8mBQsVtt34pBMzXtR'
    config.access_token        = '1803439297300754432-3yQdI5QMiVd4wOV0RWhZBFDVCf0iRo'
    config.access_token_secret = 'SeT7vBT0upIXPcCbNEfXytJ6vesx5eJ6mBjsEgEuu5ogk'
  end
end

RSpec.describe 'Twitter Client' do
  it 'authenticates with Twitter API' do
    stub_request(:post, "https://api.twitter.com/oauth2/token").
      to_return(status: 200, body: "", headers: {})

    client = twitter_client

    expect(client).to be_a(Twitter::REST::Client)
  end
end

# spec/twitter_client_spec.rb
require 'rspec'
require 'webmock/rspec'
require 'twitter'

# Méthode de connexion
def twitter_client
  Twitter::REST::Client.new do |config|
    config.consumer_key        = 'YOUR_CONSUMER_KEY'
    config.consumer_secret     = 'YOUR_CONSUMER_SECRET'
    config.access_token        = 'YOUR_ACCESS_TOKEN'
    config.access_token_secret = 'YOUR_ACCESS_TOKEN_SECRET'
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

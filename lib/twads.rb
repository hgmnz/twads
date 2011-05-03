require 'twitter'
require 'sequel'

DB = Sequel.connect('postgres://localhost/twads')

require File.expand_path('twads/twitter_user', File.dirname(__FILE__))
require File.expand_path('twads/klout_score', File.dirname(__FILE__))
require File.expand_path('twads/miner', File.dirname(__FILE__))

Twitter.configure do |config|
  config.consumer_key       = 'p1tJ8AoDPoRWAEcceOBg3w'
  config.consumer_secret    = 'dp7xAQF4A5eI1Zs3uN5qXIYS1cxAO89knJfTMbDgbY'
  config.oauth_token        = '24425454-zyLdtEBj89siKHjikKVuCaJ0ho4DdEYyBYqqwAlGT'
  config.oauth_token_secret = 'gxpiWYHo3hzfha4N4FjBkEvXFwhEHg7eFP4f7glg054'
end


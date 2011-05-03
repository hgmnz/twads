module Twads
  class KloutScore
    API_KEY = 'datz9euwd3d67k2aauz52m48'.freeze
    def initialize(twitter_users)
      @twitter_users = twitter_users
    end

    def scores
      request_uri = "http://api.klout.com/1/klout.json?key=#{API_KEY}&users=#{users_param}"
      response = request(request_uri)
      response and response["users"]
    end

    def self.find(twitter_users)
      new(twitter_users).scores
    end

    private
    def users_param
      @twitter_users.map { |user| user.screen_name }.join(',')
    end

    def request(request_uri)
      begin
        url      = URI.parse(request_uri)
        response = JSON.parse(Net::HTTP.get(url))
        if response["status"] == 200
          response
        else
          nil
        end
      rescue => error
        raise error
      end
    end
  end
end

module Twads
  class TwitterUser < Sequel::Model

    attr_accessor :klout_score

    def initialize(user)
      @twitter_user = user
      @klout_score  = -1
    end

    %w(screen_name created_at followers_count friends_count id listed_count name).each do |method|
      define_method method do
        @twitter_user.send(method)
      end
    end

    def self.find(ids)
      Twitter.users(ids).map { |user| new user  }
    end

    def save
      puts "Saving: #{self.inspect}"
    end

    def inspect
      "<TwitterUser: screen_name: #{self.screen_name} score: #{self.klout_score}>"
    end

  end
end

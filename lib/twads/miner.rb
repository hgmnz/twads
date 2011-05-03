module Twads
  class Miner

    def self.run
      while more_work?
        users  = TwitterUser.find pop_ids
        # set these ids to processed = true
        scores = KloutScore.find users
        scores and scores.each do |score|
          if user = users.detect {|u| u.screen_name == score['twitter_screen_name'] }
            user.klout_score = score['kscore']
            user.save
          end
        end
      end
    end

    def self.pop_ids
      hashes = DB[:twitter_users].filter(:processed => false).select(:twitter_id).limit(100)
    end

    def self.more_work?
      DB.where(:processed => false).count > 0
    end
  end
end

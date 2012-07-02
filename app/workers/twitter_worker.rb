class TwitterWorker
  @queue = 'twitter'
  def self.perform(auth_id)
    auth = Authentication.find(auth_id)
    user = auth.user
    get_tweets(user, auth)
  end

  def self.get_tweets(user, auth)
    last_tweet = user.tweets.last.source_id if user.tweets.any?
    params = credentials_hash(auth.credential).merge({since_id: last_tweet, count: 200})
    client = Twitter::Client.new params
    client.home_timeline.reverse.each do |tweet|
      unless user.tweets.find_by_source_id(tweet.id.to_s)
        user.tweets.create(
          content: tweet.text,
          source_id: tweet.id,
          handle: tweet.user.screen_name,
          post_time: tweet.created_at)
      end
    end
  end

  def self.credentials_hash(credential)
    {
      :consumer_key       => TWITTER_KEY,
      :consumer_secret    => TWITTER_SECRET,
      :oauth_token        => credential.token,
      :oauth_token_secret => credential.secret
    }
  end

end

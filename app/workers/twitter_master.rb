class TwitterMaster
  @queue = 'twitter_master'
  def self.perform
    twitter_users = Authentication.find_all_by_provider('twitter')
    twitter_users.each do |auth|
      Resque.enqueue(TwitterWorker, auth.id)
    end
  end
end
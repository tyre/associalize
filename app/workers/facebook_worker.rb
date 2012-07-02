class FacebookWorker
  @queue = 'facebook'
  def self.perform(auth_id)
    auth = Authentication.find(auth_id)
    user = auth.user
    graph = Koala::Facebook::API.new(auth.credential.token)
    feed_items = graph.get_connections('me', 'feed', limit: 100)
    feed_items.each do |feed_item|
      unless FeedItem.find_by_post_id(feed_item['id'])
        user.feed_items.create.add_attributes_from_hash(feed_item) 
      end
    end
  end
end
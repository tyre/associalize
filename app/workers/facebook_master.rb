class FacebookMaster
  @queue = 'facebook_master'
  def self.perform
    authentications = Authentication.find_all_by_provider('facebook')
    authentications.each do |auth|
      Resque.enqueue(FacebookWorker, auth.id)
    end
  end
end
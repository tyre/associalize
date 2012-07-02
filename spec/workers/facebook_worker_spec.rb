require "spec_helper"

describe FacebookWorker do
  let!(:user) do
      Fabricate(:user).tap do |user|
        user.authentications.create(provider: 'facebook',
          uid: '61').create_credential_from_hash({
    token:'AAAEqJh3PYGMBAFxcUhbZBq88aJbvSGogKkItC01iikcZBDunH0whW9MZAXFXr1YHsKPpCpXsKDjgCgkFmG6oNoJiRIml8RZAmKjL5raYZBAZDZD',
            secret: 'derp'}).save! #secret is ignored for FB
      end
    end

  it 'pulls from facebook and initializes FeedItems' do
    auth = user.authentications.find_by_provider('facebook')
    VCR.use_cassette('facebook/feed') do
      FacebookWorker.perform(auth.id)
    end
  end

end
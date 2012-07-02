require 'spec_helper'

describe TwitterWorker do
  context 'perform' do
    let!(:user) do
      Fabricate(:user).tap do |user|
        user.authentications.create(provider: 'twitter',
          uid: '61').add_from_hash({credentials: {
            token:'167200100-zgTC53yZ3BkBps7EqOvnuXreEsgCRb1EiAf9iGju',
            secret: 'KayS8eHTNr1x7pIq87lXL3RdWqIpb6wUeajhJnzMJ0M'
            }})

      end
    end

    it 'saves tweets to the database' do
      VCR.use_cassette('twitter/user_timeline') do
        auth_id = user.authentications.find_by_provider('twitter').id
        TwitterWorker.perform(auth_id)
      end
    end
  end
end
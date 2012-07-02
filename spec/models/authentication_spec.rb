require 'spec_helper'

describe Authentication do
  context 'creating with a hash ' do
    let(:good_hash) do
      { provider: 'twitter', 
        credentials: {token: 'walrus', secret: 'bubbles'},
        uid: 19,
        user_id: 1}
      end

      let(:bad_hash) do
        {provider: 'pinterest'}
      end
      context 'successful creation' do
        it 'creates a corresponding credential' do
          auth = Authentication.new
          auth.add_from_hash(good_hash)
          auth.credential.should be
        end
      end

      it 'fails with invalid provider' do
        auth = Authentication.new.add_from_hash(good_hash).should raise_error
      end
    end
  end
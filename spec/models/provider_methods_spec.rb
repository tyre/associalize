require 'spec_helper'

class FakeClass
  include ProviderMethods
  def authentications
    @authentications ||= []
  end
end

describe ProviderMethods do

  let(:fake_dude) { FakeClass.new }

  it 'responds to a method in the providers' do
    fake_dude.should respond_to(:has_twitter?)
  end

  context "when the authentication for the provider exists" do
    before do
      auth = double(:provider => 'twitter')
      fake_dude.authentications << auth
    end

    it "is true" do
      fake_dude.should have_twitter
    end
  end


  context "when the authentication for the provider does not exist" do
    it 'is false' do
      fake_dude.should_not have_twitter
    end
  end

end
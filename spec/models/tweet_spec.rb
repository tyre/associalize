require "spec_helper"

describe Tweet do
  URL_REGEXP = Regexp.new '\b(([\w-]+://?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|/)))'
  context 'message with a mention' do
    it 'links to that persons twitter profile' do
      t = Tweet.create(content: 'having fun with @j3!!!')
      t.content.should match(URL_REGEXP)
    end

  end
end
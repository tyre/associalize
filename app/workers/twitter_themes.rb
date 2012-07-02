require 'awesome_print'
class TwitterThemes
  COMMON_WORDS = ['the', 'a', 'as', 'it', 'he', 'she', 'you', 'i', 'if', 'when', 'had', 
    'is', 'am', 'are', 'was', 'were', 'be', 'being', 'been', 'has', 'have', 'had', 'do', 'does', 'did', 'shall', 'will', 'may', 'might', 'must', 'can', 'could', 'in', 'my', 'of', 'this', 'and', 'an', 'on']
  def self.perform(auth_id)
    auth = Authentication.find(auth_id)
    tweets = auth.user.tweets
    words = {}
    words.default = 0
    tweets.each do |tweet|
      tweet.content.split(' ').each do |word|
        if word =~ /^(\w+)/
          clean_word = $1.downcase
          words[clean_word] += 1 unless COMMON_WORDS.include?(clean_word)
        end
      end
    end
    ap words.to_a.sort {|a, b| a[1] <=> b[1]}
  end
end
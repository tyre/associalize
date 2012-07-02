class Authentication < ActiveRecord::Base
  belongs_to :user
  has_one :credential
  validates :provider, presence: true, inclusion: { in: PROVIDERS }
  attr_accessible :provider, :uid, :name, :email, :nickname, :image

  def add_from_hash(auth_hash)
    myself = self
    auth_hash.flatten.each do |key, value|
      if value && myself.respond_to?("#{key}=")
        myself.send("#{key}=", value)
      end
    end
    create_credential_from_hash(auth_hash[:credentials])
    save
  end

  def create_credential_from_hash(credential_hash)
    token = credential_hash[:token]
    secret = credential_hash[:secret]
    self.build_credential(token: token, secret: secret)
  end
end
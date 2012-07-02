Fabricator(:user, :class_name => "User") do
  email Faker::Internet.email
  password Faker::Lorem.words.join
  salt { "asdasdastr4325234324sdfds" }
  crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt("secret", 
                     "asdasdastr4325234324sdfds") }
end
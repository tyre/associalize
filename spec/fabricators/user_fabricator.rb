Fabricator(:user, :class_name => "User") do
  email Faker::Internet.email
  password 'hungry1'
  password_confirmation 'hungry1'
end
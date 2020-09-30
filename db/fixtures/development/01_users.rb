(1..5).each do |i|
  User.seed_once do |s|
    s.id = i
    s.name = "ユーザー#{i}"
    s.email = "email#{i}@example.com"
    s.password = 'password'
  end
end

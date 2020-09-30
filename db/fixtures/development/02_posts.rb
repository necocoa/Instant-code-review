user_ids = User.ids
(1..10).each do |i|
  Post.seed_once do |s|
    s.id = i
    s.title = "投稿のテスト#{i}"
    s.body = "投稿の内容\r\n## h2のタグ\r\n### h3のタグ\r\n`code`\r\n\r\n```ruby\r\ndef index\r\n  User.all\r\nend\r\n```"
    s.user_id = user_ids.sample
  end
end

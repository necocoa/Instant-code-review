FactoryBot.define do
  factory :post do
    user
    title { '投稿のテスト' }
    body { '投稿のbody-------body' }
  end
end

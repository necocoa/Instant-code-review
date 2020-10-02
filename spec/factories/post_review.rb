FactoryBot.define do
  factory :post_review do
    post
    user
    body { '投稿のレビュー〜〜〜〜〜〜〜〜レビュー' }
  end
end

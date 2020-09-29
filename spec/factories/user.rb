FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |i| "test_#{i}@example.com" }
    password { 'factory_password' }
  end
end

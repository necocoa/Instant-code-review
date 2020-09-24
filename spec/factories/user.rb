FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    sequence(:email) { |i| "test_#{i}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

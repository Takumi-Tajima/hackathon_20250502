FactoryBot.define do
  factory :meal_ket do
    sequence(:name) { |n| "食材#{n}" }
    description { '美味しい食材です' }
    price { 1000 }
    is_frozen { false }
    published_at { nil }
  end
end

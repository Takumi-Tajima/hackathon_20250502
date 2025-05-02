FactoryBot.define do
  factory :meal_ket do
    sequence(:name) { |n| "ミールキット食材#{n}" }
    description { '美味しいミールキットです' }
    price { 1000 }
    is_frozen { false }
    published_at { nil }
  end
end

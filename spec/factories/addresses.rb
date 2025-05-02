FactoryBot.define do
  factory :address do
    user { nil }
    region { "MyString" }
    detail { "MyString" }
    is_primary { false }
  end
end

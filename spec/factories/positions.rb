FactoryBot.define do
  factory :position do
    title { "MyString" }
    active { false }
    historical_index { 1 }
    employee { nil }
  end
end

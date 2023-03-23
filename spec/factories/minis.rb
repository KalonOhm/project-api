FactoryBot.define do
  factory :mini do
    user { nil }
    collection { nil }
    group { nil }
    subgroup { nil }
    mini_name { "MyString" }
    loadout { "MyString" }
    quantity { 1 }
    description { "MyString" }
  end
end

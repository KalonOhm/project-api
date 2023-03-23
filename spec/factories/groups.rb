FactoryBot.define do
  factory :group do
    user { nil }
    collection { nil }
    group_name { "MyString" }
    string { "MyString" }
  end
end

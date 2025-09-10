FactoryBot.define do
  factory :lesson do
    student { nil }
    classroom_name { "MyString" }
    date { "2025-09-04" }
    course { "MyString" }
    type { "" }
  end
end

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    # ユーザー作成時に必ず生徒を1人以上つける
    after(:build) do |user|
      user.students << build(:student, user: user) if user.students.blank?
    end
  end

  factory :student do
    name { "太郎" }
    association :user
  end

  # userと一緒にstudentを作る Factory
  factory :user_with_student, parent: :user do
    after(:create) do |user|
      create(:student, user: user)
    end
  end

  factory :admin_user, class: User do
    name { "Admin" } 
    email { "admin@example.com" }
    password { "password" }
    admin { true }  # 管理者フラグ

    after(:build) do |user|
      user.students << build(:student, user: user) if user.students.blank?
    end
  end
end

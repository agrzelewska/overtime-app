FactoryBot.define do

  factory :user do
    first_name { "Jon" }
    last_name { "Snow" }
    sequence(:email) { |i| "test#{i}@test.com" }
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
  end

  factory :admin_user, class: AdminUser do
    first_name { "Kate" }
    last_name { "Fall" }
    sequence(:email) { |i| "admin#{i}@test.com" }
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
  end
end
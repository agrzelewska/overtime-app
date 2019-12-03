FactoryBot.define do
  sequence(:email) { |i| "test#{i}@test.com" }

  factory :user do
    first_name { "Jon" }
    last_name { "Snow" }
    email { generate "email"}
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
    phone { "555555555" }
  end

  factory :admin_user, class: AdminUser do
    first_name { "Kate" }
    last_name { "Fall" }
    email { generate "email"}
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
    phone { "5555555555" }
  end

end
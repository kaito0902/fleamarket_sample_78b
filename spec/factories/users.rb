FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"password0"}
    password_confirmation {"password0"}
    first_name            {"田原"}
    last_name             {"刑事"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"ケイジ"}
    birthday_year         {"2000-01-01"}
    birthday_month        {"2000-01-01"}
    birthday_day          {"2000-01-01"}
    tel                   {"11122223333"}
  end
end
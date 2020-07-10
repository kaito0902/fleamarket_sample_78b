FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {"password0"}
    password_confirmation {"password0"}
    first_name            {"刑事"}
    last_name             {"田原"}
    first_name_kana       {"ケイジ"}
    last_name_kana        {"タナカ"}
    birthday_year         {"2020-01-01"}
    birthday_month        {"2020-01-01"}
    birthday_day          {"2020-01-01"}
    tel                   {"11122223333"}
  end
end
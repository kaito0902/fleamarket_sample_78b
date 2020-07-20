FactoryBot.define do
  factory :credit_card do
    user_id {1}
    customer_id { 2 }
    card_token {3}
  end
end
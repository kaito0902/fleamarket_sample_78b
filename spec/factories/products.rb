FactoryBot.define do
  factory :product do
    name              {"名前"}
    description       {"説明"}
    brand_id          {}
    prefecture        {1}
    day               {"abe"}
    price             {111111}
    buyer_id          {1}
    delivery_charge
    condition
    category
    saler_id       {FactoryBot.create(:user).id}
    after(:build) do |product|
      product.images << build(:image)
    end
  end
end
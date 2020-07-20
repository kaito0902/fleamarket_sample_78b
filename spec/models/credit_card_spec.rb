require 'rails_helper'

# RSpec.describe CreditCard, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe CreditCard do

  describe '#create' do
  
    it "user_id,customer_id, card_tokenを全て存在すれば登録できること" do
      user = create(:user)
      card = FactoryBot.build(:credit_card, user_id: user[:id])
      expect(card).to be_valid
    end
  
    it "user_idがない場合は登録できないこと" do
      card = build(:credit_card, user_id: nil)
      card.valid?
      expect(card.errors[:user]).to include("を入力してください")
    end
    
    it "customer_idがない場合は登録できないこと" do
      card = build(:credit_card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    
    it "card_tokenがない場合は登録できないこと" do
    card = build(:credit_card, card_token: nil)
    card.valid?
    expect(card.errors[:card_token]).to include("を入力してください")
    end
  end
end

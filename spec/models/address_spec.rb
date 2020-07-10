require 'rails_helper'
RSpec.describe Address, type: :model do
  describe '#create' do
    it "post_code、prefecture、city、house_numberが入力されていれば登録できること" do
      expect(build(:address)).to be_valid
    end

    it "post_codeが空では登録できないこと" do
      address= build(:address, post_code:"")
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end

    it "prefectureが空では登録できないこと" do
      address= build(:address, prefecture:"")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityが空では登録できないこと" do
      address= build(:address, city:"")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "house_numberが空では登録できないこと" do
      address= build(:address, house_number:"")
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end


    it "post_codeがハイホンなし7文字であれば登録できること" do
      address= build(:address, post_code: "1234567")
      expect(address).to be_valid
    end

    it "post_codeがハイホンあり7文字では登録できないこと" do
      address= build(:address, post_code:"123-4567")
      address.valid?
      expect(address.errors[:post_code]).to include("はハイホンなし7桁で入力して下さい")
    end

    it "post_codeがハイホンなし7文字以外では登録できないこと" do
      address= build(:address, post_code:"12345678")
      address.valid?
      expect(address.errors[:post_code]).to include("はハイホンなし7桁で入力して下さい")
    end
  end
end
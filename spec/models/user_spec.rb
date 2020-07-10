require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    it "全ての情報が入力されていれば登録できること" do
      expect(build(:user)).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname:"")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name:"")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "last_nameが空では登録できないこと" do
      user = build(:user, last_name:"")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana:"")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "last_name_kanaが空では登録できないこと" do
      user = build(:user, last_name_kana:"")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "birthday_yearが空では登録できないこと" do
      user = build(:user, birthday_year:"")
      user.valid?
      expect(user.errors[:birthday_year]).to include("を入力してください")
    end

    it "birthday_monthが空では登録できないこと" do
      user = build(:user, birthday_month:"")
      user.valid?
      expect(user.errors[:birthday_month]).to include("を入力してください")
    end

    it "birthday_dayが空では登録できないこと" do
      user = build(:user, birthday_day:"")
      user.valid?
      expect(user.errors[:birthday_day]).to include("を入力してください")
    end

    it "telが空では登録できないこと" do
      user = build(:user, tel:"")
      user.valid?
      expect(user.errors[:tel]).to include("を入力してください")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmation登録できないこと" do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "emailが重複していたら登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "telが重複していたら登録できないこと" do
      user = create(:user)
      another_user = build(:user, tel: user.tel)
      another_user.valid?
      expect(another_user.errors[:tel]).to include("はすでに存在します")
    end

    it "emailに@とドメインがない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailに@がない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "emailにドメインがない場合は登録できないこと" do
      user = build(:user, email:"kkkgmail@com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "passwor", password_confirmation: "passwor")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "passwo", password_confirmation: "passwo")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "first_nameが全角ひらがなであれば登録できること" do
      user = build(:user, first_name:"かめ")
      expect(user).to be_valid
    end

    it "first_nameが全角カタカナであれば登録できること" do
      user = build(:user, first_name:"イルカ")
      expect(user).to be_valid
    end

    it "first_nameが漢字であれば登録できること" do
      user = build(:user, first_name:"八神")
      expect(user).to be_valid
    end

    it "first_nameが半角カタカナの場合は登録できないこと" do
      user = build(:user, first_name:"ｲﾙｶ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "first_nameが半角英文字の場合は登録できないこと" do
      user = build(:user, first_name:"aa")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "first_nameが全角英文字の場合は登録できないこと" do
      user = build(:user, first_name:"AA")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "last_nameが全角ひらがなであれば登録できること" do
      user = build(:user, last_name:"かカ")
      expect(user).to be_valid
    end

    it "last_nameが全角カタカナであれば登録できること" do
      user = build(:user, last_name:"イルカ")
      expect(user).to be_valid
    end

    it "last_nameが漢字であれば登録できること" do
      user = build(:user, last_name:"八神")
      expect(user).to be_valid
    end

    it "last_nameが半角カタカナの場合は登録できないこと" do
      user = build(:user, last_name:"ｲﾙｶ")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "last_nameが半角英文字の場合は登録できないこと" do
      user = build(:user, last_name:"aa")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "last_nameが全角英文字の場合は登録できないこと" do
      user = build(:user, last_name:"AA")
      user.valid?
      expect(user.errors[:last_name]).to include("は全角ひらがな、カタカナ、漢字で入力して下さい")
    end

    it "first_name_kanaが全角カタカナであれば登録できること" do
      user = build(:user, first_name:"イルカ")
      expect(user).to be_valid
    end

    it "first_name_kanaが半角カタカナの場合は登録できないこと" do
      user = build(:user, first_name_kana:"ｲﾙｶ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力して下さい")
    end

    it "first_name_kanaが全角カタカナでない場合は登録できないこと" do
      user = build(:user, first_name_kana:"亀")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角カタカナで入力して下さい")
    end

    it "last_name_kanaが全角カタカナであれば登録できること" do
      user = build(:user, last_name:"イルカ")
      expect(user).to be_valid
    end

    it "last_name_kanaが半角カタカナの場合は登録できないこと" do
      user = build(:user, last_name_kana:"ｲﾙｶ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カタカナで入力して下さい")
    end

    it "last_name_kanaが全角カタカナでない場合は登録できないこと" do
      user = build(:user, last_name_kana:"亀")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("は全角カタカナで入力して下さい")
    end

    it "telが10桁であれば登録できること" do
      user = build(:user, tel:"1111111111")
      expect(user).to be_valid
    end

    it "telが11桁であれば登録できること" do
      user = build(:user, tel:"11111111111")
      expect(user).to be_valid
    end

    it "telが10桁or11桁でない場合は登録できないこと" do
      user = build(:user, tel:"12345")
      user.valid?
      expect(user.errors[:tel]).to include("はハイフンなし10桁or11桁で入力して下さい")
    end

    it "telにハイホンがある場合は登録できないこと" do
      user = build(:user, tel:"123-452222")
      user.valid?
      expect(user.errors[:tel]).to include("はハイフンなし10桁or11桁で入力して下さい")
    end
  end
end
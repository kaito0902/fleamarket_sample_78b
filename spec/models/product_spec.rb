require 'rails_helper'
describe Product do
  describe '#create' do
    it "全ての入力条件を満たしたら送信できること" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id])
      expect(product).to be_valid
    end
    it "名前の入力がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "説明の入力がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end
    it "発送元の入力がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], prefecture: "")
      product.valid?
      expect(product.errors[:prefecture]).to include("を入力してください")
    end
    it "発送までの日数入力がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], day: "")
      product.valid?
      expect(product.errors[:day]).to include("を入力してください")
    end
    it "価値の入力がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "発送料の負担の選択がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], delivery_charge: nil)
      product.valid?
      expect(product.errors[:delivery_charge]).to include("を入力してください")
    end
    it "商品状態の選択がない場合は登録できないこと" do
      user = create(:user)
      image = create(:image)
      product = build(:product, saler_id: user[:id], condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end
    it " 説明文が1001文字以上であれば登録できないこと " do
      product = build(:product, description: "a"*1001 )
      product.valid?
      expect(product.errors[:description]).to include("は1000文字以内で入力してください")
    end
    it " 説明文が1000文字以内であれば登録できること " do
      product = build(:product, description: "a"*1000 )
      expect(product).to be_valid
    end
    it " namaが41文字以上であれば登録できないこと " do
      product = build(:product, name: "a"*41 )
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end
    it " namaが40文字以内であれば登録できること " do
      product = build(:product, name: "a"*40 )
      expect(product).to be_valid
    end
    it "price(値段)が299以下であれば登録できないこと " do
      product = build(:product, price: 299 )
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
    it " price(値段)が300以上であれば登録できること " do
      product = build(:product, price: 300 )
      expect(product).to be_valid
    end
    it "price(値段)が10000000以上であれば登録できないこと " do
      product = build(:product, price: 10000000 )
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end
    it " price(値段)が9999999以下であれば登録できること " do
      product = build(:product, price: 9999999 )
      expect(product).to be_valid
    end
  end
end


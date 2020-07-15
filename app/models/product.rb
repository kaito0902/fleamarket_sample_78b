class Product < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  validates :images, presence: true
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :delivery_charge
  belongs_to :condition
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many :comments
  validates :name, presence: true, length:{maximum:40}
  validates :description, presence: true, length:{maximum:1000}
  validates :category, presence: true
  validates :condition, presence: true
  validates :delivery_charge, presence: true
  validates :prefecture, presence: true
  validates :day, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

  # productのお気に入り判定 → vies側で呼び出し
  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  enum prefecture:{
    "   ":"   ",
    北海道:"北海道",青森県:"青森県",岩手県:"岩手県",宮城県:"宮城県",秋田県:"秋田県",山形県:"山形県",福島県:"福島県",
    茨城県:"茨城県",栃木県:"栃木県",群馬県:"群馬県",埼玉県:"埼玉県",千葉県:"千葉県",東京都:"東京都",神奈川県:"神奈川県",
    新潟県:"新潟県",富山県:"富山県",石川県:"石川県",福井県:"福井県",山梨県:"山梨県",長野県:"長野県",
    岐阜県:"岐阜県",静岡県:"静岡県",愛知県:"愛知県",三重県:"三重県",
    滋賀県:"滋賀県",京都府:"京都府",大阪府:"大阪府",兵庫県:"兵庫県",奈良県:"奈良県",和歌山県:"和歌山県",
    鳥取県:"鳥取県",島根県:"鳥取県",岡山県:"岡山県",広島県:"広島県",山口県:"山口県",
    徳島県:"徳島県",香川県:"香川県",愛媛県:"愛媛県",高知県:"高知県",
    福岡県:"福岡県",佐賀県:"佐賀県",長崎県:"長崎県",熊本県:"熊本県",大分県:"大分県",宮崎県:"宮崎県",鹿児島県:"鹿児島県",沖縄県:"沖縄県"
  }
end

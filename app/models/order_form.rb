class OrderForm
  include ActiveModel::Model

  # 配送先と購入記録の２つのモデルの全てのカラムを扱えるようにする
  attr_accessor :user_id, :item_id,:post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    # purchase_recodeモデルのバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # トークンのバリデーション
    validates :token
  end

  # データをそれぞれのテーブルに保存する処理
  def save
    # 購入情報を保存し、purchase_recordに代入する
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # purchase_record_idには、変数purchase_recordのidと指定する
    Order.create(purchase_record_id: purchase_record.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
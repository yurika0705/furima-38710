class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブル とのアソシエーション
  belongs_to :user
  # has_one :purchase_record
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :scheduled_delivery

  # アクティブストレージとのアソシエーション
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
    validates :category_id, length: { minimum: 1 }
    validates :sales_status_id, length: { minimum: 1 }
    validates :shipping_free_status_id, length: { minimum: 1 }
    validates :prefecture_id, length: { minimum: 1 }
    validates :scheduled_delivery_id, length: { minimum: 1 }
    # 300円以上かつ9,999,999円以下で、半角英数字でないと入力不可
    validates :price, inclusion: { in: 300..9_999_999 }, numericality: { only_integer: true }
  end

  # ジャンル選択が「ーー」の時は保存不可
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_free_status_id
    validates :scheduled_delivery_id
    validates :prefecture_id
  end
end

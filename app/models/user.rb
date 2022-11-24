class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 半角英数字を使用すること
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で設定してください'
  # 全角文字を使用すること
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  # 全角カタカナを使用すること
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :nick_name, presence: true
  validates :birth_date, presence: true

  has_many :items
  # has_many :puchase_records
end

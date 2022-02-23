class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end

  with_options presence: true,format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
    validates :last_name_katakana
    validates :first_name_katakana
  end

  validates :birthday , presence: true
end

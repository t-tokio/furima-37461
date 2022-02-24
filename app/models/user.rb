class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数を両方含む必要があります'}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :last_name_kanji
    validates :first_name_kanji
  end

  with_options presence: true,format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナ文字を使用してください' } do
    validates :last_name_katakana
    validates :first_name_katakana
  end

  validates :birthday , presence: true
end

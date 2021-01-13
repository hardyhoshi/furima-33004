class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, allow_blank: true, message: 'は英字と数字の両方を含めて設定してください' }
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, allow_blank: true, message: 'は全角(漢字・ひらがな・カタカナ)で入力してください' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true, message: 'は全角で入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end

  has_many :items
  has_many :orders
end

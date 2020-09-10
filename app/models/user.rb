class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :birthday, :nickname
    validates :family_name, :first_name
    validates :family_name_reading, :first_name_reading
  end
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字で、6文字以上にしてください' }
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
  validates :family_name_reading, :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'はアットマークを含めて入力してください' }

  has_many :items
  has_many :purchases
end

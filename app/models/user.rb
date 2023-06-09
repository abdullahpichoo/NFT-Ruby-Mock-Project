class User < ApplicationRecord
  has_one :wallet, dependent: :destroy
  has_one :cart, dependent: :destroy

  validates :username, length: { maximum: 20 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

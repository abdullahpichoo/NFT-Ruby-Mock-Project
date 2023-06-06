class Nft < ApplicationRecord
  # mount_uploader :images, ImageUploader
  # serialize :images, JSON # If you use SQLite, add this line.
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 100 },
                    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
  validates :image, presence: true

  has_many :carts, through: :orderables
  has_many :orderables, dependent: :destroy

  belongs_to :wallet
end

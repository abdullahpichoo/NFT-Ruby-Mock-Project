class Cart < ApplicationRecord
  belongs_to :user
  has_many :nfts, through: :orderables
  has_many :orderables, dependent: :destroy

  def total
    sum = 0
    orderables.each do |order|
      sum += order.item_price
    end
    sum
  end
end

class Orderable < ApplicationRecord
  belongs_to :cart
  belongs_to :nft

  def item_price
    nft.price
  end
end

json.extract! transaction, :id, :Buyer, :Seller, :Buy_price, :Change_in_price, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)

json.extract! wallet, :id, :balance, :items_sold, :earnings, :user_id, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)

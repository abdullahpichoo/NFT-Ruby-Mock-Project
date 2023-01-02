json.extract! nft, :id, :name, :price, :created_by, :wallet_id, :created_at, :updated_at
json.url nft_url(nft, format: :json)

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :NFT_name, null: false
      t.integer :NFT_id, null: false
      t.integer :Buyer_id, null: false
      t.integer :Seller_id, null: false
      t.string :Buyer, null: false
      t.string :Seller, null: false
      t.decimal :Buy_price, default: 0
      t.decimal :Change_in_price, default: 0
      t.datetime :transaction_time

      t.timestamps
    end
  end
end

class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :orderables do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :nft, null: false, foreign_key: true

      t.timestamps
    end
  end
end

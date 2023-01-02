class CreateNfts < ActiveRecord::Migration[7.0]
  def change
    create_table :nfts do |t|
      t.string :name
      t.decimal :price
      t.string :created_by
      t.string :owner
      t.string :images
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end

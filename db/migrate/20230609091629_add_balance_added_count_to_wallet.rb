class AddBalanceAddedCountToWallet < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :balance_added_count, :integer, default: 0
  end
end

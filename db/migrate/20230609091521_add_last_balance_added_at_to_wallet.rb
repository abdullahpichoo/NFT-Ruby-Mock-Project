class AddLastBalanceAddedAtToWallet < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :last_balance_added_at, :datetime
  end
end

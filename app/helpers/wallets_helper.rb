module WalletsHelper
  def check_balance?(nft_price, input_balance)
    nft_price > input_balance
  end

  def update_buy_paramaters(nft, seller_wallet, current_user)
    nft.wallet_id = current_user.wallet.id
    nft.owner = current_user.username
    seller_wallet.earnings += nft.price
    seller_wallet.items_sold += 1
    seller_wallet.balance += nft.price
    current_user.wallet.balance -= nft.price

    seller_wallet.save
    nft.save
    current_user.wallet.save
  end

  def buy?(id)
    @nft = Nft.find(id)
    @wallet = Wallet.find(@nft.wallet_id)
    @seller = User.find(@wallet.user_id)
    @old_transacton = Transaction.order('transaction_time desc').first

    buyprice = if @old_transacton.nil?
                 0
               else
                 @old_transacton.Buy_price
               end
    return false if check_balance?(@nft.price, current_user.wallet.balance) # a>b -> true

    @transaction = Transaction.create(
      NFT_name: @nft.name,
      NFT_id: @nft.id,

      Buyer: current_user.username,
      Seller: @seller.username,

      Buyer_id: current_user.id,
      Seller_id: @seller.id,
      Buy_price: @nft.price,
      transaction_time: Time.zone.now,
      Change_in_price: (buyprice - @nft.price).abs
    )

    update_buy_paramaters(@nft, @wallet, current_user)
    true
  end
end

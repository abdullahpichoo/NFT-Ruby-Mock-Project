module WalletsHelper

  def check_balance?(nft_price, input_balance)
    nft_price > input_balance
  end

  def update_buy_paramaters(nft, seller_wallet, current_user)
    nft.update(wallet_id: current_user.wallet.id, owner: current_user.username)
    seller_wallet.update(earnings: seller_wallet.earnings + nft.price, 
                          items_sold: seller_wallet.items_sold + 1, 
                          balance: seller_wallet.balance + nft.price) 
    current_user.wallet.update(balance: current_user.wallet.balance - nft.price)
  end

  def buy_all?
    # ActiveRecord::Base.transaction is used to ensure Atomicity (either all the transactions are successful or none of them are)
    ActiveRecord::Base.transaction do
      @cart.orderables.each do |order|
        nft = order.nft
        seller = nft.wallet.user

        if check_balance?(nft.price, current_user.wallet.balance)
          raise ActiveRecord::Rollback
          false
        else
          create_transaction(nft, seller)
          update_buy_paramaters(nft, seller.wallet, current_user)
          order.destroy
        end
        
      end
    end
    true
  end

  def buy?(id)
    nft = Nft.find(id)
    seller = nft.wallet.user
    if check_balance?(nft.price, current_user.wallet.balance)
      false
    else
      create_transaction(nft, seller)
      update_buy_paramaters(nft, seller.wallet, current_user)
      true
    end
  end

  def create_transaction(nft, seller)
    Transaction.create(
      NFT_name: nft.name,
      NFT_id: nft.id,
      Buyer: current_user.username,
      Seller: seller.username,
      Buyer_id: current_user.id,
      Seller_id: seller.id,
      Buy_price: nft.price,
      transaction_time: Time.zone.now,
      Change_in_price: (nft.price - 0).abs
    )
  end

  # def buy?(id)
  #   @nft = Nft.find(id)
  #   @wallet = Wallet.find(@nft.wallet_id)
  #   @seller = User.find(@wallet.user_id)
  #   @old_transacton = Transaction.order('transaction_time desc').first

  #   buyprice = if @old_transacton.nil?
  #                0
  #              else
  #                @old_transacton.Buy_price
  #              end
  #   return false if check_balance?(@nft.price, current_user.wallet.balance) # a>b -> true

  #   @transaction = Transaction.create(
  #     NFT_name: @nft.name,
  #     NFT_id: @nft.id,

  #     Buyer: current_user.username,
  #     Seller: @seller.username,

  #     Buyer_id: current_user.id,
  #     Seller_id: @seller.id,
  #     Buy_price: @nft.price,
  #     transaction_time: Time.zone.now,
  #     Change_in_price: (buyprice - @nft.price).abs
  #   )

  #   update_buy_paramaters(@nft, @wallet, current_user)
  #   true
  # end
end

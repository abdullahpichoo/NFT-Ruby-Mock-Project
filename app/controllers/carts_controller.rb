class CartsController < ApplicationController
  def show

  end

  def add
    current_order=@cart.orderables.find_by(nft_id: params[:id])

    if current_order.nil?
      @cart.orderables.create(nft_id: params[:id])
      @cart.save
    end

    redirect_to all_path,notice: "NFT added to cart"
  end


  def remove
    Orderable.find_by(params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
        partial:'carts/cart',
        locals: {cart: @cart},
      )
      end
    end
  end
end

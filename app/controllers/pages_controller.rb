class PagesController < ApplicationController
  def home; end

  def homepage; end

  def explore; end

  def nftshow; end

  def profile
    if !User.exists?(id: params[:user_id])
      redirect_to all_path, notice: 'User does not exist anymore'
    else
      @user = User.find(params[:user_id])
      @wallet = Wallet.find(@user.wallet.id)
      @nfts = @wallet.nfts.all
    end
  end

  def sign; end

  def cart; end

  def trxtable; end
end

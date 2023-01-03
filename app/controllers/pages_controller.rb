class PagesController < ApplicationController
  before_action :authenticate_user!,only: %i[profile]

  def home; end

  def homepage
    @top_picks = Nft.order(Arel.sql('RANDOM()')).limit(3)
  end

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

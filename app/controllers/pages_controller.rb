class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home homepage explore sign cart trxtable]
  def home; end

  def homepage
    if Nft.count >= 3
      @hot_items = Nft.all.includes(:image_attachment).sample(3)
    end
  end

  def explore; end

  def nftshow; end

  def profile
    if !User.exists?(id: params[:user_id])
      redirect_to all_path, notice: 'User does not exist anymore'
    else
      @user = User.find(params[:user_id])
      @wallet = Wallet.find(@user.wallet.id)
      @nfts = @wallet.nfts.all.includes(:image_attachment)
    end
  end

  def sign; end

  def cart; end

  def trxtable; end
end

class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[home homepage explore sign cart trxtable]
  def home; end

  def homepage
    if Nft.count >= 3
      @hot_items = Nft.all.includes(:image_attachment, :wallet).where.not(wallet_id: current_user&.wallet&.id).sample(3)
    end
  end

  def explore; end

  def nftshow; end

  def profile
    if !User.exists?(id: params[:user_id])
      redirect_to all_path, alert: 'User Does Not Exist Anymore'
    else
      @user = User.find(params[:user_id])
      @nfts = @user.wallet.nfts.all.includes(:image_attachment)
    end
  end

  def sign; end

  def cart; end

  def trxtable; end
end

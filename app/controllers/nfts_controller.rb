class NftsController < ApplicationController
  before_action :authenticate_user!, except: %i[all]
  before_action :check_wallet, only: %i[show edit update destroy]
  before_action :get_wallet, except: %i[all]
  before_action :set_nft, only: %i[show edit update destroy]

  def all
    filtered = Nft.where('name LIKE ?', "%#{params[:filter]}%").all
    @transactions = Transaction.order('transaction_time desc').limit(4)
    @top_picks = Nft.all.sample(3)
    @pagy, @nfts = pagy(filtered.all, items: 10)
  end

  # GET /nfts or /nfts.json
  def index
    redirect_to transactions_path, notice: 'User does not exist' if @wallet.nil?
    @nfts = @wallet.nfts.all
  end

  # GET /nfts/1 or /nfts/1.json
  def show
    @user = User.find_by(username: @nft.owner)
    @owner_wallet = @user.wallet
    @owner_nfts = @owner_wallet.nfts.all
  end

  # GET /nfts/new
  def new
    @nft = @wallet.nfts.new
  end

  # GET /nfts/1/edit
  def edit; end

  # POST /nfts or /nfts.json
  def create
    @nft = @wallet.nfts.
                        new(nft_params.merge(created_by: current_user.username, owner: current_user.username))

    respond_to do |format|
      if @nft.save
        format.html { redirect_to wallet_nft_path(@wallet, @nft), notice: 'Nft was successfully created.' }
        format.json { render :show, status: :created, location: @nft }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nfts/1 or /nfts/1.json
  def update
    respond_to do |format|
      if @nft.update(price: params[:price])
        format.html { redirect_to wallet_nft_path(@wallet, @nft), notice: 'Nft was successfully updated.' }
        format.json { render :show, status: :ok, location: @nft }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nfts/1 or /nfts/1.json
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_nft
    return if @wallet.nil?

    @nft = @wallet.nfts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def nft_params
    params.require(:nft).permit(:name, :price, :created_by, :wallet_id, :owner, :image)
  end

  def get_wallet
    @wallet = Wallet.find(params[:wallet_id])
  end

  def check_wallet
    return if Wallet.exists?(params[:wallet_id])

    redirect_to all_path, notice: 'Nft not found'
  end
end

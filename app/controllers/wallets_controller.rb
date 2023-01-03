class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def buy_all
    if current_user.wallet.balance < @cart.total
      redirect_to all_path, alert: 'Insufficient balance'
    else
      check = false
      @cart.orderables.each do |order|
        check = helpers.buy?(order.nft.id)
        Orderable.find(order.id).destroy
      end
    end

    return unless check

    redirect_to all_path, notice: 'Purchase successful'
  end

  def buy_nft
    if helpers.buy?(params[:id])
      redirect_to all_path, notice: 'Purchase successful'
    else
      redirect_to all_path, alert: 'Insufficient balance'
    end
  end

  # GET /wallets/1 or /wallets/1.json
  def show; end

  # GET /wallets/new
  def new
    @wallet = current_user.build_wallet
  end

  # GET /wallets/1/edit
  def edit; end

  # POST /wallets or /wallets.json
  def create
    @wallet = current_user.create_wallet(wallet_params)

    respond_to do |format|
      if current_user.wallet.save
        format.html { redirect_to all_path, notice: 'Wallet was successfully created.' }
        format.json { render :show, status: :created, location: @wallet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallets/1 or /wallets/1.json
  def update
    value = params[:balance].to_i + current_user.wallet.balance
    respond_to do |format|
      if current_user.wallet.update(balance: value)
        format.html { redirect_to user_profile_path(current_user), notice: 'Wallet was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wallet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallets/1 or /wallets/1.json
  def destroy
    @wallet.destroy

    respond_to do |format|
      format.html { redirect_to all_path, notice: 'Wallet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wallet
    @wallet = current_user.wallet
  end

  # Only allow a list of trusted parameters through.
  def wallet_params
    params.require(:wallet).permit(:balance, :items_sold, :earnings, :user_id)
  end
end

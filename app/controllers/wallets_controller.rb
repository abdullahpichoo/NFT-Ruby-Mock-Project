class WalletsController < ApplicationController
  before_action :wallet, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def buy_all
    if current_user.wallet.balance < @cart.total
      redirect_to all_path, alert: 'Insufficient Balance!'
    elsif helpers.buy_all?
      redirect_to all_path, notice: 'Purchase successful'
    else
      redirect_to all_path, notice: 'Purchase failed'
    end
  end


  def buy_nft
    if helpers.buy?(params[:id])
      redirect_to all_path, notice: 'Purchase Successful'
    else
      redirect_to all_path, alert: 'Insufficient Balance!'
    end
  end

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

    if can_add_balance?
      add_balance
      redirect_to user_profile_path(current_user), notice: 'Wallet was successfully updated.'
    else
      redirect_to user_profile_path(current_user), alert: 'You have reached the balance addition limit for today! Please try again tomorrow.'
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
  def wallet
    @wallet ||= current_user.wallet
  end

  # Only allow a list of trusted parameters through.
  def wallet_params
    params.require(:wallet).permit(:balance, :items_sold, :earnings, :user_id)
  end

  def add_balance
    current_user.wallet.update(balance: current_user.wallet.balance + 1, 
                                last_balance_added_at: Time.current, 
                                balance_added_count: current_user.wallet.balance_added_count + 1)
  end

  def can_add_balance?
    return true if current_user.wallet.last_balance_added_at.nil? || current_user.wallet.balance_added_count.nil?

    last_added_time = current_user.wallet.last_balance_added_at
    current_time = Time.current
    time_diff = current_time - last_added_time
    time_diff_hours = time_diff / 1.hour

    (time_diff_hours >= 24) || (current_user.wallet.balance_added_count + 1 <= 14)
  end
 
end

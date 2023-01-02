class OrderablesController < ApplicationController
  # before_action :set_orderable, only: %i[ show edit update destroy ]

  # # GET /orderables or /orderables.json
  # def index
  #   @orderables = Orderable.all
  # end

  # # GET /orderables/1 or /orderables/1.json
  # def show
  # end

  # # GET /orderables/new
  # def new
  #   @orderable = Orderable.new
  # end

  # # GET /orderables/1/edit
  # def edit
  # end

  # # POST /orderables or /orderables.json
  # def create
  #   @orderable = Orderable.new(orderable_params)

  #   respond_to do |format|
  #     if @orderable.save
  #       format.html { redirect_to orderable_url(@orderable), notice: "Orderable was successfully created." }
  #       format.json { render :show, status: :created, location: @orderable }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @orderable.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /orderables/1 or /orderables/1.json
  # def update
  #   respond_to do |format|
  #     if @orderable.update(orderable_params)
  #       format.html { redirect_to orderable_url(@orderable), notice: "Orderable was successfully updated." }
  #       format.json { render :show, status: :ok, location: @orderable }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @orderable.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /orderables/1 or /orderables/1.json
  # def destroy
  #   @orderable.destroy

  #   respond_to do |format|
  #     format.html { redirect_to orderables_url, notice: "Orderable was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_orderable
  #     @orderable = Orderable.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def orderable_params
  #     params.require(:orderable).permit(:user_id, :nft_id)
  #   end
end

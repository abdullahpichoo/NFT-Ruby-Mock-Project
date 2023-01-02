class TransactionsController < ApplicationController
  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end
end

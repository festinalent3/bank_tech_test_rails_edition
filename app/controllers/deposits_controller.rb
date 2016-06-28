class DepositsController < ApplicationController

  def new
    # @account = Account.find(params[:account_id])
    @deposit = Deposit.new
  end
end

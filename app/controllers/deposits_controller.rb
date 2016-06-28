class DepositsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @deposit = Deposit.new
  end

  def create
    @account = Account.find(params[:account_id])
    @account.makeDeposit(deposit_params)
    redirect_to account_path(@account.id)
  end

  private
  
  def deposit_params
    params.require(:deposit).permit(:amount)
  end
end

class WithdrawalsController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @withdrawal = Withdrawal.new
  end

  def create
    @account = Account.find(params[:account_id])
    @account.makeWithdrawal(withdrawal_params)
    redirect_to account_path(@account.id)
  end

  private
  def withdrawal_params
    params.require(:withdrawal).permit(:amount)
  end

end

class AccountsController < ApplicationController

  def index
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    redirect_to account_path(@account.id)
  end

  def show
    @account = Account.find(params[:id])
  end

  private
  def account_params
    params.require(:account).permit(:name)
  end
end

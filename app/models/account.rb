class Account < ActiveRecord::Base
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def getBalance
    return getDeposits - getWithdrawals
  end

  def makeWithdrawal(withdrawal_params)
    self.withdrawals.create(withdrawal_params) unless getDeposits - getWithdrawals == 0
  end

  def makeDeposit(deposit_params)
    self.deposits.create(deposit_params)
  end

  private

  def getDeposits
    sum = 0
    self.deposits.each do |deposit|
      sum += deposit.amount
    end
    return sum
  end

  def getWithdrawals
    sum = 0
    self.withdrawals.each do |withdrawal|
      sum += withdrawal.amount
    end
    return sum
  end

end

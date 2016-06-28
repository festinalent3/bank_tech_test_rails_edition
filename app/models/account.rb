class Account < ActiveRecord::Base
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy
  sum = 0.0

  def getBalance
    return getDeposits - getWithdrawals
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

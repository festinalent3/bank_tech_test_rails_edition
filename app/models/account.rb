class Account < ActiveRecord::Base
  has_many :deposits, dependent: :destroy
  has_many :withdrawals, dependent: :destroy

  def getBalance
    sum = 0.0;
    self.deposits.each do |deposit|
      sum += deposit.amount
    end
    self.withdrawals.each do |withdrawal|
      sum -= withdrawal.amount
    end
    return sum
  end

end

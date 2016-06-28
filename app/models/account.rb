class Account < ActiveRecord::Base
  has_many :deposits, dependent: :destroy

  def getBalance
    sum = 0.0;
    self.deposits.each do |deposit|
      sum += deposit.amount
    end
    return sum
  end
end

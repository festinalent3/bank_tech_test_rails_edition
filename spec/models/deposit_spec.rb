require "spec_helper"

describe Deposit, type: :model do
  it { should belong_to :account}

  it 'does not have any special validation requirements for the moment' do
    deposit = Deposit.new(amount: 999999999999999)
    expect(deposit).to be_valid
  end

end

require "spec_helper"

describe Account, type: :model do

  it { should have_many :deposits }
  it { should have_many :withdrawals }


  it 'does not have any special validation requirements for the moment' do
    account = Account.new(name: "lol")
    expect(account).to be_valid
  end

  describe '#getBalance' do
    let(:account) { Account.create name: 'MyAccount123' }

    it 'returns the total current balance' do
      account.deposits.create(amount: 150)
      account.withdrawals.create(amount: 50)
      expect(account.getBalance).to eq 100.0
    end
  end

  describe '#makeWithdrawal' do
    let(:account) { Account.create name: 'MyAccount123' }

    it 'returns the total current balance' do
      account.deposits.create(amount: 150)
      expect(account.makeWithdrawal(amount: 50)).to be_a Withdrawal
      expect(account.getBalance).to eq 100.0
    end
  end

  describe '#makeDeposit' do
    let(:account) { Account.create name: 'MyAccount123' }

    it 'returns the total current balance' do
      expect(account.makeDeposit(amount: 150)).to be_a Deposit
      expect(account.getBalance).to eq 150.0
    end
  end

end


# TODO: Use that to create better validation on withrawals and later deposits

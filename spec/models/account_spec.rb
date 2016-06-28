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
      expect(account.getBalance).to eq 150
    end
  end

end

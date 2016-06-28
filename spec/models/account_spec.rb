require "spec_helper"

describe Account, type: :model do
  it { should have_many :deposits}

  it 'does not have any special validation requirements for the moment' do
    account = Account.new(name: "lol")
    expect(account).to be_valid
  end
  
end

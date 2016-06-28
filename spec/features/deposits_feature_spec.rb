require 'rails_helper'

feature 'Bank deposits' do
  before do
    visit '/accounts'
    click_link 'Open an account'
    fill_in('Name', with: 'lol')
    click_button('Create Account')
  end

  context 'no deposits should be added' do
    scenario 'should suggest the user makes a deposit' do
      expect(page).to have_content 'Current Balance: 0.00'
      expect(page).to have_link 'Make a deposit'
    end

    scenario 'user can make a deposit' do
      click_link 'Make a deposit'
      expect(page).to have_content 'Amount'
      expect(page).to have_button 'Create Deposit'
    end

    scenario 'user sees the deposit is added to the balance' do
      click_link 'Make a deposit'
      fill_in('Amount', with: 999)
      click_button('Create Deposit')
      expect(page).to have_content 'Current Balance: 999.00'
    end
  end
end

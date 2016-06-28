require 'rails_helper'

feature 'Bank withdrawals' do
  before do
    visit '/accounts'
    click_link 'Open an account'
    fill_in('Name', with: 'lol')
    click_button('Create Account')
  end

  context 'no deposits are added' do
    scenario 'user should not be able to make withdrawal' do
      expect(page).to have_content 'Current Balance: 0.00'
      expect(page).not_to have_link 'Make a withdrawal'
    end
  end

  context 'deposits are added' do
    before do
      click_link 'Make a deposit'
      fill_in('Amount', with: 999)
      click_button('Create Deposit')
      expect(page).to have_content 'Current Balance: 999.00'
    end

    scenario 'user should be able to make withdrawal' do
      expect(page).to have_content 'Current Balance: 999.00'
      expect(page).to have_link 'Make a withdrawal'
    end
    scenario 'user sees new balance after withdrawal' do
      click_link 'Make a withdrawal'
      fill_in('Amount', with: 50)
      click_button('Create Withdrawal')
      expect(page).to have_content 'Current Balance: 949.00'
    end
  end
end

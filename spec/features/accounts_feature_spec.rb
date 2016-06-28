require 'rails_helper'

feature 'Bank Accounts' do
  context 'no account is created' do
    scenario 'should suggest the user open an account' do
      visit '/accounts'
      expect(page).to have_link 'Open an account'
    end

    scenario 'should prompt user to fill in a name for their account when opening one' do
      visit '/accounts'
      click_link 'Open an account'
      expect(page).to have_content 'Name'
    end

    scenario 'displays a balance of zero in a new account' do
      visit '/accounts'
      click_link 'Open an account'
      fill_in('Name', with: 'lol')
      click_button('Create Account')
      expect(page).to have_content 'Current Balance: 0.00'
    end
  end
end

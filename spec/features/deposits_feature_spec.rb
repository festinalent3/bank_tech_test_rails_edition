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
  end
end
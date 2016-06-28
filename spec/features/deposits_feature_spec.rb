require 'rails_helper'

feature 'Bank deposits' do
  context 'no deposits should be added' do
    scenario 'should suggest the user makes a deposit' do
      visit '/account'
      expect(page).to have_content 'Current Balance: 0.00'
      expect(page).to have_link 'Make a deposit'
    end
  end
end

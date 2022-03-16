require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'new page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'Dan',
                            email: 'dan@gmail.com',
                            password: '1234567',
                            password_confirmation: '1234567')
     
     @group = Group.create!(name: 'category1', icon: 'test.png', user_id: @danny.id)
      within('#new_user') do
        fill_in 'Email', with: 'dan@gmail.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
      expect(page).to have_content('category1')
      click_link 'category1'
      expect(page).to have_current_path group_payments_path(@group.id)
      click_link 'Add transaction'
      expect(page).to have_current_path new_group_payment_path(@group.id)
    end

   it 'Add new transactions page have the right content' do
        expect(page).to have_content('Name')
        expect(page).to have_content('Amount')
      end

   it 'Add new transactions page has the right fields' do
       expect(page).to have_field('payment[name]')
       expect(page).to have_field('payment[amount]')
    end
    
  end
end

require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'index page' do
    before(:each) do
      visit user_session_path
      @danny = User.create!(name: 'Dan',
                            email: 'dan@gmail.com',
                            password: '1234567',
                            password_confirmation: '1234567')

      within('#new_user') do
        fill_in 'Email', with: 'dan@gmail.com'
        fill_in 'Password', with: '1234567'
      end
      click_button 'Log in'
    end

    it 'expect page path after sign in to be groups path' do
      expect(page).to have_current_path groups_path
    end

    it 'categories page shows the right content' do
      expect(page).to have_content('Categories')
      expect(page).to have_content('Logout')
      expect(page).to have_link('Add category')
    end

    it 'clicking on add category link should go to add category page' do
      click_link 'Add category'
      expect(page).to have_current_path new_group_path
    end
  end
end

require 'rails_helper'

RSpec.describe 'group', type: :feature do
  describe 'new page' do
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
      click_link 'Add category'
    end

    it 'expect to have add category page' do
      expect(page).to have_current_path new_group_path
    end

    it 'Add category page shows the right content' do
      expect(page).to have_content('Name')
      expect(page).to have_content('Icon')
      expect(page).to have_button('Add Category')
    end

    it 'Add category page has the right fields' do
        expect(page).to have_field('group[name]')
        expect(page).to have_field('group[icon]')
      end
  end
end

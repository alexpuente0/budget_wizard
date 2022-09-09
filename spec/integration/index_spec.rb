require 'rails_helper'

RSpec.describe 'Group', type: :feature do
  describe 'index page' do
    before(:each) do
      User.destroy_all
      Group.destroy_all
      Expense.destroy_all
      @user = User.create(name: 'Dwight', email: 'dschrute@dmpaper.com', password: 'blackbear', confirmed_at: Time.now)
      @group = Group.create!(name: 'crops',
                             icon: 'https://en.apkshki.com/storage/8080/icon_603fb76823be0_8080_w256.png', user: @user)
      @expense = Expense.create!(name: 'beets', amount: 250, user: @user, group: @group)
      visit user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit groups_path
    end
    it 'should display page title: Categories' do
      expect(page).to have_content('Categories')
    end
    it 'should display a button to add a new category' do
      expect(page).to have_content('Add a New Category')
    end
    it 'should display a Log out button' do
      expect(page).to have_content('Log out')
    end
    it 'should redirect to create new category page on button press' do
      click_link 'Add a New Category'
      expect(page).to have_current_path(new_group_path)
    end
    it 'should display category called crops' do
      expect(page).to have_content('crops')
    end
    it 'should render a total amount spent on Category' do
      expect(page).to have_content('$250')
    end
  end
end

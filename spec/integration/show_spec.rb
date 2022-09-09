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
      visit expense_index_path(group_id: @group.id)
    end
    it 'should render EXPENSES title' do
      expect(page).to have_content(@group.name)
    end
    it 'should render a ADD EXPENSE link' do
      expect(page).to have_content('Add a New Transaction')
    end
    it 'should redirecto to new expense page' do
      click_link 'Add a New Transaction'
      expect(page).to have_current_path(expense_new_path(group_id: @group.id))
    end
    it 'should render a expense called beets' do
      expect(page).to have_content('beets')
    end
    it 'should render a total amount spent' do
      expect(page).to have_content('$250')
    end
  end
end

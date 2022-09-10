require 'rails_helper'

RSpec.describe 'Splash', type: :feature do
  describe 'before LogIn' do
    before(:each) do
      User.destroy_all
      @user = User.create(name: 'Dwight', email: 'dschrute@dmpaper.com', password: 'blackbear',
                          confirmed_at: Time.now)
      visit splash_path
    end
    it 'Confirms connection success' do
      expect(page).to have_http_status(:success)
    end
    it 'Displays App Logo' do
    find_by_id('page_logo')
    end
    it 'Displays LogIn button' do
      expect(page).to have_content('Login')
    end
    it 'Displays Sign Up button' do
      expect(page).to have_content('Signup')
    end

    describe 'After login' do
      it 'Redirects user to Main Page' do
        click_link 'Login'
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_button 'Log in'
        expect(page).to have_current_path(groups_path)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'User Feature', type: :feature do
  describe 'Sign Up Action' do
    it 'signs up a new user' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'Margaret'
      fill_in 'user_email', with: 'user_one@weirdmail.com'
      fill_in 'user_password', with: '690392'
      fill_in 'user_password_confirmation', with: '690392'
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    it 'log in an existing user' do
      User.create!(name: 'Margaret', email: 'user_one@weirdmail.com', password: '690392',
                   password_confirmation: '690392')
      visit new_user_session_path
      fill_in 'user_email', with: 'user_one@weirdmail.com'
      fill_in 'user_password', with: '690392'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
  end
end

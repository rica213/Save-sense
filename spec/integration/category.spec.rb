require 'rails_helper'

RSpec.describe 'Category Feature', type: :feature do
  before(:each) do
    @user_one = User.create!(name: 'Margaret', email: 'user_one@weirdmail.com', password: '690392',
                             password_confirmation: '690392')
    @category_one = Category.create(name: 'Beauty', icon: 'http://geab.za/wutebupa', author_id: @user_one.id)
    @trade_one = Trade.create(name: 'Bodyshop cream', amount: 25, author_id: @user_one.id)
    @trade_category_one = TradeCategory.create(trade_id: @trade_one.id, category_id: @category_one.id)

    visit new_user_session_path
    fill_in 'user_email', with: @user_one.email
    fill_in 'user_password', with: @user_one.password
    click_button 'Log in'
  end

  describe 'Index Category Action' do
    it 'shows all categories' do
      visit categories_path
      expect(page).to have_content('Add Category')
      expect(page).to have_content('Beauty')
    end
  end

  describe 'Show Category Action' do
    it 'shows a category' do
      visit category_path(@category_one.id)
      expect(page).to have_content('Bodyshop cream')
    end

    it 'contains total amount of transactions' do
      visit category_path(@category_one.id)
      expect(page).to have_content('Total amount: $25')
    end
  end

  describe 'New Category Action' do
    it 'redirects to the form to add new category' do
      visit new_category_path
      expect(page).to have_content('Save Category')
    end
  end
end

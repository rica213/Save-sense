require 'rails_helper'

RSpec.describe 'Trade feature', type: :feature do
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

  describe 'category_trades GET  /categories/:category_id/trades' do
    it 'shows all trades that belongs to a specific category' do
      visit category_trades_path(@category_one)
      expect(page).to have_content('Bodyshop cream')
    end

    it 'contains total amount of transactions' do
      visit category_trades_path(@category_one)
      expect(page).to have_content('Total amount: $25')
    end
  end

  describe 'New Trade Action' do
    it 'redirects to the form to add new trade' do
      visit new_trade_path
      expect(page).to have_content('Save Transaction')
    end
  end
end

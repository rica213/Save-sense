require 'rails_helper'

RSpec.describe Trade, type: :model do
  before :all do
    @user = User.create(name: 'Kristen Stewart')
    @trade = Trade.create(name: 'Bodyshop cream', amount: 25, author_id: @user.id)
  end
  describe 'Validation' do
    it 'should validate the presence of a name' do
      @trade.name = nil
      expect(@trade).to_not be_valid
    end

    it 'should validate the presence of an amount' do
      @trade.amount = nil
      expect(@trade).to_not be_valid
    end

    it 'should validate the length of the name' do
      @trade.name = 'a' * 51
      expect(@trade).to_not be_valid
    end

    it 'should validate the amount is a number' do
      @trade.amount = 'a'
      expect(@trade).to_not be_valid
    end
  end
end

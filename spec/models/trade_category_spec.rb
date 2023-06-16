require 'rails_helper'

RSpec.describe TradeCategory, type: :model do
  describe 'Association' do
    it 'should belong to a trade' do
      t = TradeCategory.reflect_on_association(:trade)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should belong to a category' do
      t = TradeCategory.reflect_on_association(:category)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end

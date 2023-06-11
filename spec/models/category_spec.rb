require 'rails_helper'

RSpec.describe Category, type: :model do
  before :all do
    @user = User.create(name: 'Kristen Stewart')
    @category = Category.create(name: 'Food', user_id: @user.id)
  end

  describe 'Validation' do
    it 'should validate the presence of a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'should validate the length of the name' do
      @category.name = 'a' * 51
      expect(@category).to_not be_valid
    end
  end

  describe 'Association' do
    it 'should belong to a user' do
      t = Category.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it 'should have many trades' do
      t = Category.reflect_on_association(:trades)
      expect(t.macro).to eq(:has_many)
    end
  end
end

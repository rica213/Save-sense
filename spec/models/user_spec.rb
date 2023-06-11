require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'Kristen Stewart')
  end
  describe "Validation" do
    it 'should validate the presence of a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'should validate the length of the name' do
      @user.name = 'a' * 51
      expect(@user).to_not be_valid
    end
  end
end

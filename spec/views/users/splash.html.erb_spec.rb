require 'rails_helper'

RSpec.describe 'users/splash.html.erb', type: :view do
  describe 'GET /splash' do
    it 'returns http success' do
      render
      expect(rendered).to include('Sense Save')
      expect(rendered).to include('Sign up')
      expect(rendered).to include('Log in')
    end
  end
end

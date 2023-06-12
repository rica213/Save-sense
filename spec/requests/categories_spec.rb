require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET categories/' do
    it 'returns http redirect' do
      get '/categories/'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http redirect' do
      get '/categories/new'
      expect(response).to have_http_status(:redirect)
    end
  end
end

require 'rails_helper'

RSpec.describe 'Trades', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/trades'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/trades/new'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/trades/create'
      expect(response).to have_http_status(:redirect)
    end
  end
end

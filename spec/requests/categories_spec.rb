require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET categories/" do
    it "returns http success" do
      get "/categories/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/categories/new"
      expect(response).to have_http_status(:success)
    end
  end

end

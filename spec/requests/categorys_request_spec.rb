require 'rails_helper'

RSpec.describe "Categorys", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/categorys/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/categorys/new"
      expect(response).to have_http_status(:success)
    end
  end

end

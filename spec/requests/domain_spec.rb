require 'rails_helper'

RSpec.describe "Domains", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/domain/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/domain/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/domain/show"
      expect(response).to have_http_status(:success)
    end
  end

end

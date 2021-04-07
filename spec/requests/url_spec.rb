require 'rails_helper'

RSpec.describe "Urls", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/urls/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "redirects to show on http success" do
      post "/urls", params: { url: { full_url: "www.google.com"} }
      expect(response).to redirect_to '/urls/1'
    end

    it "redirects to root on http 302 found" do
      post "/urls", params: { url: { full_url: "a"} }
      expect(response).to redirect_to "/"
    end
  end
end

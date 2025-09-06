require 'rails_helper'

RSpec.describe "Admin::PointGrants", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/admin/point_grants/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admin/point_grants/create"
      expect(response).to have_http_status(:success)
    end
  end

end

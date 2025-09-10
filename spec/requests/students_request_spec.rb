require 'rails_helper'

RSpec.describe "Students", type: :request do

  describe "GET /history" do
    it "returns http success" do
      get "/students/history"
      expect(response).to have_http_status(:success)
    end
  end

end

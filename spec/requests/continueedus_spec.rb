require 'rails_helper'

RSpec.describe "Continueedus", type: :request do
  describe "GET /continueedus" do
    it "works! (now write some real specs)" do
      get continueedus_path
      expect(response).to have_http_status(200)
    end
  end
end

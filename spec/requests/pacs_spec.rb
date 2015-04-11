require 'rails_helper'

RSpec.describe "Pacs", type: :request do
  describe "GET /pacs" do
    it "works! (now write some real specs)" do
      get pacs_path
      expect(response).to have_http_status(200)
    end
  end
end

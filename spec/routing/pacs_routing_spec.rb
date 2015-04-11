require "rails_helper"

RSpec.describe PacsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pacs").to route_to("pacs#index")
    end

    it "routes to #new" do
      expect(:get => "/pacs/new").to route_to("pacs#new")
    end

    it "routes to #show" do
      expect(:get => "/pacs/1").to route_to("pacs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/pacs/1/edit").to route_to("pacs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/pacs").to route_to("pacs#create")
    end

    it "routes to #update" do
      expect(:put => "/pacs/1").to route_to("pacs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pacs/1").to route_to("pacs#destroy", :id => "1")
    end

  end
end

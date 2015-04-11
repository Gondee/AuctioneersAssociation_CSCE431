require "rails_helper"

RSpec.describe ContinueedusController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/continueedus").to route_to("continueedus#index")
    end

    it "routes to #new" do
      expect(:get => "/continueedus/new").to route_to("continueedus#new")
    end

    it "routes to #show" do
      expect(:get => "/continueedus/1").to route_to("continueedus#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/continueedus/1/edit").to route_to("continueedus#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/continueedus").to route_to("continueedus#create")
    end

    it "routes to #update" do
      expect(:put => "/continueedus/1").to route_to("continueedus#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/continueedus/1").to route_to("continueedus#destroy", :id => "1")
    end

  end
end

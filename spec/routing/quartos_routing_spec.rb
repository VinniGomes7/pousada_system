require "rails_helper"

RSpec.describe QuartosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/quartos").to route_to("quartos#index")
    end

    it "routes to #new" do
      expect(get: "/quartos/new").to route_to("quartos#new")
    end

    it "routes to #show" do
      expect(get: "/quartos/1").to route_to("quartos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/quartos/1/edit").to route_to("quartos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/quartos").to route_to("quartos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/quartos/1").to route_to("quartos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/quartos/1").to route_to("quartos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/quartos/1").to route_to("quartos#destroy", id: "1")
    end
  end
end

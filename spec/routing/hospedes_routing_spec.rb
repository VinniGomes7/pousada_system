require "rails_helper"

RSpec.describe HospedesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hospedes").to route_to("hospedes#index")
    end

    it "routes to #new" do
      expect(get: "/hospedes/new").to route_to("hospedes#new")
    end

    it "routes to #show" do
      expect(get: "/hospedes/1").to route_to("hospedes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/hospedes/1/edit").to route_to("hospedes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hospedes").to route_to("hospedes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hospedes/1").to route_to("hospedes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hospedes/1").to route_to("hospedes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hospedes/1").to route_to("hospedes#destroy", id: "1")
    end
  end
end

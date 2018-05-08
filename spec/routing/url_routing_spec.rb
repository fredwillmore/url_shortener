require "rails_helper"

describe UrlsController do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/").to route_to("urls#create")
    end

    it "routes to #index" do
      expect(get: "/").to route_to("urls#index")
    end

    it "routes to #index" do
      expect(get: "/:short/display").to route_to("urls#index", "short"=>":short")
    end

    it "routes to #show" do
      expect(get: "/abcd").to route_to({ controller: 'urls', action: "show", short: "abcd" })
    end

  end
end

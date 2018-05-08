require 'rails_helper'

describe UrlsController do

  it "should get index" do
    get :index
    expect(response).to render_template :index
  end

  it "Requests to shortened URLs should redirect to the original URL" do
    @url = FactoryBot.create :url
    get :show, params: { short: @url.short }
    expect(response).to redirect_to @url.full
  end

  it "should create url" do
    expect do
      post :create, params: { url: { full: 'http://www.example.com' } }
    end.to change(Url, :count)

    expect(response).to render_template :index
  end
  
  it "should return an error message for invalid url" do
    expect do
      post :create, params: { url: { full: 'hello I am wrong' } }
    end.to_not change(Url, :count)  

    expect(response).to render_template :index
  end

end

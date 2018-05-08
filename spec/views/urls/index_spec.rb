require "rails_helper"

describe 'urls/index' do
  it "should have a text field for the user to enter a URL and a submit button to request the shortened URL" do
    render
    assert_select 'input[type=text]#url_full'
    assert_select 'input[type=submit]'
  end

  it "should display notice" do
    flash[:notice] = "Hello this is a notice"
    render
    expect(rendered).to match 'Hello this is a notice'
  end
end
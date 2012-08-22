require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/'
      page.should have_content('Welcome')
    end
  end
end
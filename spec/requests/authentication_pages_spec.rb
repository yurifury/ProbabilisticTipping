require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "log in" do
    before { visit login_path }

    let(:user) { FactoryGirl.create(:user) }
    it { should have_selector('h1', text: "Log In") }
  end
end
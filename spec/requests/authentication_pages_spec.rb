require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "log in" do
    before { visit login_path }

    let(:user) { FactoryGirl.create(:user) }
    let(:login) { "Log in" }
    it { should have_selector('h1', text: "Log In") }

    describe "with invalid information" do
      before { click_button login }

      it { should have_selector('h1', text: "Log In") }
      it { should have_selector('.alert-error') }
    end
  end
end
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

    describe "with valid information" do
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button login
      end
      it { should have_selector('a', text: "Log Out") }
      it { should have_selector('a', text: user.email) }
    end
  end
end
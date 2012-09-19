require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signin" do
    before { visit login_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Test User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count)
      end
    end
  end
end
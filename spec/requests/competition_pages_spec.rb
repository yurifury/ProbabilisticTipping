require 'spec_helper'

describe "Competition Pages" do
  subject { page }
  let!(:competitor_set) { FactoryGirl.create(:competitor_set) }
  before { valid_login(FactoryGirl.create(:user)) }
  describe "competition creation" do
    before { visit new_competition_path }
    it { should have_selector('h1', text: "Create a new") }

    describe "with invalid information" do
      it "should not create a competition" do
        expect { click_button "Create Competition" }.not_to change(Competition, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "Some Competition"
        select competitor_set.name, from: "Competitor set"
        click_button "Create Competition"
      end
      it { should have_selector('.alert', text: "Competition created") }
    end
  end
end

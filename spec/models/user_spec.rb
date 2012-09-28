require 'spec_helper'

describe User do
  let(:user) { User.new(name: "Example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar") }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should respond_to(:authenticate) }
  it { should respond_to(:competitions) }

  it { should be_valid }

  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { user.email = " " }
    it { should_not be_valid }
  end

  describe "competition creation association" do
    before { user.save }
    let!(:competition) { FactoryGirl.create(:competition, user: user) }

    it "should destroy associated competitions on user deletion" do
      competitions = user.competitions
      user.destroy
      competitions.each do |comp|
        Competition.find_by_id(comp.id).should be_nil
      end
    end
  end
end

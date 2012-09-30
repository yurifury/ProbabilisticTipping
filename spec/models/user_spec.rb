require 'spec_helper'

describe User do
  let(:user) { User.new(name: "Example User", email: "user@example.com",
                        password: "foobar", password_confirmation: "foobar") }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should respond_to(:authenticate) }
  it { should respond_to(:owned_competitions) }

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
    let!(:competition) { FactoryGirl.create(:competition, owner: user) }

    it "should destroy associated competitions on user deletion" do
      competitions = user.owned_competitions
      user.destroy
      competitions.each do |comp|
        Competition.find_by_id(comp.id).should be_nil
      end
    end

    describe "automatically participating in the competition they own" do
      it { should be_participating_in(competition) }
    end

    describe "another competition" do
      let(:new_competition) { FactoryGirl.create(:competition) }

      it { should_not be_participating_in new_competition }
      it "should be a competition" do
        new_competition.should be_a Competition
      end

      describe "participating" do
        before { user.participate_in new_competition}
        it { should be_participating_in new_competition }

        describe "unparticipating" do
          before { user.unparticipate_in new_competition }
          it { should_not be_participating_in new_competition }
          it "competition should still exist" do
            Competition.find(new_competition.id).should_not be_nil
          end
        end
      end
    end
  end
end

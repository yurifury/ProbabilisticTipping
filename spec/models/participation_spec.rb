require 'spec_helper'

describe Participation do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:participation) { user.participations.create(competition_id: competition.id) }

  subject { participation }

  it { should be_valid }
  it "should make the user participate in the competition" do
    user.should be_participating_in(competition)
  end
end

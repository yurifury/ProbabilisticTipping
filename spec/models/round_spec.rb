require 'spec_helper'

describe Round do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:round) { competition.rounds.build(closing_time: Time.now + 10.minutes) }
  before { round.save }

  subject { round }

  it { should be_open }
  its(:competition) { should == competition }

  describe "past the closing date" do
    before { Timecop.travel(20.years.from_now) }
    it { should_not be_open }
  end
end

require 'spec_helper'

describe Round do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:round) { competition.rounds.build(closing_date: Time.now + 1.day) }
  before { round.save }

  subject { round }

  it { should respond_to(:competition) }
  it { should respond_to(:closing_date) }
  it { should respond_to(:open?) }

  it { should be_open }
  its(:competition) { should == competition }
  it { should be_valid }

  describe "a closing date of today" do
    before { round.closing_date = Time.now + 10.minutes }
    it { should_not be_valid }
  end

  describe "a closing date of yesterday" do
    before { round.closing_date = Time.now - 1.day }
    it { should_not be_valid }
  end

  describe "past the closing date" do
    before { Timecop.travel(20.years.from_now) }
    it { should_not be_open }
  end
end

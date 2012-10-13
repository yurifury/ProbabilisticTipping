require 'spec_helper'

describe Match do
  let(:round) { FactoryGirl.create(:round) }
  let(:c1) { FactoryGirl.create(:competitor) }
  let(:c2) { FactoryGirl.create(:competitor) }
  let(:match) { round.matches.build(competitor_1: c1, competitor_2: c2)}

  subject { match }

  it { should respond_to(:competitor_1) }
  it { should respond_to(:competitor_2) }
  it { should respond_to(:round) }
  it { should respond_to(:competition) }
  it { should respond_to(:tips) }
  it { should respond_to(:tippers) }
  its(:round) { should == round }
  it { should be_valid }
  describe "with the same competitor vsing themselves" do
    before { match.competitor_1 = match.competitor_2 }
    it { should_not be_valid }
  end

end

require 'spec_helper'

describe Tip do
  let(:match) { FactoryGirl.create(:match) }
  let(:user) { FactoryGirl.create(:user) }
  let(:tip) { match.tips.create(user_id: user.id, :probability => 55) }
  subject { tip }

  it { should respond_to(:user) }
  it { should respond_to(:match) }
  it { should respond_to(:probability) }
  it { should be_valid }

  its(:user) { should be_in(match.tippers) }

  describe "outside defined probability ranges" do
    describe "less than 1" do
      before { tip.probability = 0 }
      it { should_not be_valid }
    end

    describe "greater than 99" do
      before { tip.probability = 100 }
      it { should_not be_valid }
    end
  end
end

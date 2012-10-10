require 'spec_helper'

describe Result do
  let(:match) { FactoryGirl.create(:match) }
  let(:result) { match.create_result(winner: "1") }

  subject { result }

  it { should be_valid }
  it { should respond_to(:match) }
  it { should respond_to(:round) }
  it { should respond_to(:competition) }

  describe "competitor 2 winning" do
    before { result.winner = "2" }
    it { should be_valid }
  end

  describe "a draw" do
    before { result.winner = "draw" }
    it { should be_valid }
  end

  describe "some other value" do
    before { result.winner = "foo" }
    it { should_not be_valid }
  end
end

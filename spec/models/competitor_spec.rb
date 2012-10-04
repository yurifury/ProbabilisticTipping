require 'spec_helper'

describe Competitor do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:competitor) { competition.competitors.build(name: "IdrA") }
  subject { competitor }

  it { should respond_to(:name) }
  it { should respond_to(:matches) }
  it { should be_valid }
  describe "with no name" do
    before { competitor.name = "" }
    it { should_not be_valid }
  end
end

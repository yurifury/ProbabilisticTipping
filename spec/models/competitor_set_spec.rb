require 'spec_helper'

describe CompetitorSet do
  let(:user) { FactoryGirl.create(:user) }
  let(:competitor_set) { user.competitor_sets.build(name: "AFL 2012") }
  subject { competitor_set }

  it { should respond_to(:owner) }
  it { should respond_to(:competitions) }
  it { should respond_to(:competitors) }
end

require 'spec_helper'

describe Competition do
  let(:user) { FactoryGirl.create(:user) }
  let(:competition) { user.competitions.build(name: "Starcraft Comp #1") }

  subject { competition }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it { should respond_to(:finished) }
  its(:user) { should == user }

  it { should be_valid }
  it { should_not be_finished }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Competition.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { subject.user_id = nil }
    it { should_not be_valid }
  end
end

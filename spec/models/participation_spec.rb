require 'spec_helper'

describe Participation do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:user) { FactoryGirl.create(:user) }

  let(:participation) { user.participation.build(competition_id: user.id) }

  subject { participation }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Participation.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
end

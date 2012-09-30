require 'spec_helper'

describe Participation do
  let(:competition) { FactoryGirl.create(:competition) }
  let(:user) { FactoryGirl.create(:user) }

  let(:participation) { user.participations.build(competition_id: competition.id) }

  subject { participation }

  it { should be_valid }
end

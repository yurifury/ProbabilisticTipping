require 'spec_helper'

describe Match do
  let(:round) { FactoryGirl.create(:round) }
  let(:match) { round.matches.build(player1: "boxer", player2: "idra")}

  subject { match }

  it { should respond_to(:player1) }
  it { should respond_to(:player2) }
  it { should respond_to(:round) }
  it { should respond_to(:competition) }
  its(:round) { should == round }
end

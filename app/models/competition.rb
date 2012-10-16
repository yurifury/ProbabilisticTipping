class Competition < ActiveRecord::Base
  attr_accessible :name, :competitor_set_id

  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  has_many :participations
  has_many :participants, through: :participations, source: :user

  has_many :rounds

  belongs_to :competitor_set
  has_many :competitors, through: :competitor_set

  validates :user_id, presence: true
  validates :name, presence: true
  validates :competitor_set, presence: true

  after_create :participate_owner

  Result = Struct.new(:participant, :score)
  def participant_scores
    r = []
    participants.each do |participant|
      score = 0
      rounds.each do |round|
        score += round.score_for(participant).round(2)
      end
      r << Result.new(participant, score)
    end
    r.sort {|x, y| y.score <=> x.score}
  end

  def score_for(user)
    score = 0
    rounds.each do |round|
      score += round.score_for(user)
    end
    score.round(2)
  end

  private
    def participate_owner
      participants << owner
    end
end

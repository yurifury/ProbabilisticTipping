class Round < ActiveRecord::Base
  attr_accessible :closing_date, :matches_attributes, :results_entered
  belongs_to :competition
  has_many :matches
  accepts_nested_attributes_for :matches

  validate :round_closing_date_cannot_be_today_or_in_the_past, on: :create

  def round_closing_date_cannot_be_today_or_in_the_past
    unless closing_date.nil? or closing_date.blank?
      if closing_date.today? or closing_date.past?
        errors.add(:closing_date, "can't be today or in the past")
      end
    else
      errors.add(:closing_date, "can't be blank")
    end
  end

  def open?
    Time.now < closing_date
  end

  def has_results?
    results_entered
  end

  def tipped?(user)
    tipped = false
    matches.each do |match|
      tipped = true unless match.tip_of_user(user).nil?
    end
    tipped
  end

  def score_for(user)
    score = 0
    matches.each do |match|
      tip = match.tip_of_user(user)
      unless tip.nil?
        score += tip.calc_score
      end
    end
    score
  end

  Result = Struct.new(:participant, :score)
  def participant_scores
    scores = []
    competition.participants.each do |participant|
      scores << Result.new(participant, score_for(participant).round(2))
    end
    scores.sort {|x, y| y.score <=> x.score}
  end
end

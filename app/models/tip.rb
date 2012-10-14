class Tip < ActiveRecord::Base
  attr_accessible :probability, :user_id

  belongs_to :user
  belongs_to :match

  validates :match_id, presence: true
  validates :user_id, presence: true
  validate :probability_between_1_and_99

  def probability_between_1_and_99
    unless probability.nil? or probability.blank?
      unless probability.between?(1, 99)
        errors.add(:probability, "must be between 1 and 99")
      end
    else
      errors.add(:probability, "can't be blank")
    end
  end

  def calc_score
    return 0 if match.result.nil?
    p = probability.to_f / 100
    result = match.result.winner
    if result == "1"
      1 + Math.log2(1 - p)
    elsif result == "2"
      1 + Math.log2(p)
    elsif probability == 50
      0
    elsif result == "draw"
      1 + 1/2*Math.log2(p*(1-p))
    end
  end
end

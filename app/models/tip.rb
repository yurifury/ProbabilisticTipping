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
end

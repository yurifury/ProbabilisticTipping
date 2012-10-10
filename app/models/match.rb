class Match < ActiveRecord::Base
  attr_accessible :competitor_1_id, :competitor_2_id, :competitor_1, :competitor_2
  belongs_to :competitor_1, class_name: 'Competitor'
  belongs_to :competitor_2, class_name: 'Competitor'
  belongs_to :round
  has_one :competition, through: :round

  has_one :result

  validate :competitors_cant_play_themselves

  validates :competitor_1_id, presence: true
  validates :competitor_2_id, presence: true

  def competitors_cant_play_themselves
    if competitor_1 == competitor_2
      errors.add(:competitor_1, "A Competitor can't play themselves!")
    end
  end
end

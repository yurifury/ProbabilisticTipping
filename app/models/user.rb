class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_many :owned_competitions, foreign_key: 'user_id', class_name: 'Competition', dependent: :destroy

  has_many :participations
  has_many :participating_competitions, through: :participations, source: :competition

  has_many :competitor_sets, foreign_key: 'owner_id', class_name: 'CompetitorSet'

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  before_save { generate_token(:auth_token) }

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def participate_in(competition)
    participating_competitions << competition
  end

  def unparticipate_in(competition)
    participating_competitions.delete competition
  end

  def participating_in?(competition)
    competition.in?(participating_competitions)
  end

  def has_tips_for?(round)
  end
end

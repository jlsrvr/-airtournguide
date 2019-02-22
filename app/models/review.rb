class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :content, length: { minimum: 20 }, presence: true
  validates :user, presence: true
  validates :rating, presence: true

  def blank_stars
   5 - rating.to_i
  end
end

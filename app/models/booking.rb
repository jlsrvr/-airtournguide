class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :date, presence: true
end

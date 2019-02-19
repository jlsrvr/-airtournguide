class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :user
  validates :status, inclusion: { in: %w[Pending Accepted Declined] }
  validates :date, presence: true
end

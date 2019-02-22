class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :city, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  include PgSearch
  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :content, length: { minimum: 20 }
end

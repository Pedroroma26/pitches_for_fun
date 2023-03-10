class Review < ApplicationRecord
  belongs_to :booking
  has_one :pitch, through: :bookings

  validates :rating, presence: true, numericality: { only_integer: true }, length: { in: 0..5 }
  validates :comment, presence: true, length: { minimum: 3 }
end

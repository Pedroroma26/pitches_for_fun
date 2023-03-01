class Pitch < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :bookings
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pitch_type, presence: true, inclusion: { in: %w[Basketball Padel Tenis Football Futsal Field-Hockey Hockey Volleyball Handball] }

end

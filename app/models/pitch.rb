class Pitch < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pitch_type, presence: true, inclusion: { in: %w[Basketball Padel Tenis Football Futsal Field-Hockey Hockey Volleyball Handball] }
end

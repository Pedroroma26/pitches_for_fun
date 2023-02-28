class Pitch < ApplicationRecord
  belongs_to :user
  has_many :review, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :type, presence: true, inclusion: { in: %w[Basketball Padel Tenis Football Futsal Field-Hockey Hockey Volleyball Handball] }
end

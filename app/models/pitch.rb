class Pitch < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :pitch_type, presence: true, inclusion: { in: %w[Basketball Padel Tenis Football Futsal Field-Hockey Hockey Volleyball Handball] }

  def average_rating
    reviews = get_reviews
    (reviews.pluck(:rating).sum / reviews.length.to_f).round(1)
  end

  def review_count
    get_reviews.count
  end

  private

  def get_reviews
    reviews = []
    bookings.each do |booking|
      booking.reviews.each do |review|
        reviews << review
      end
    end
    return reviews
  end
end

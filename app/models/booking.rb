class Booking < ApplicationRecord
  belongs_to :pitch
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_time, presence: true, comparison: { less_than: :end_time }
end

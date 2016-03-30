class Showtime < ActiveRecord::Base
  belongs_to :movie, inverse_of: :showtimes
  belongs_to :theatre, inverse_of: :showtimes
  has_many :orders, inverse_of: :showtime

  validates :time, presence:   true
end

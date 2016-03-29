class Movie < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :showtime

  validates :title, presence: true

  validates :description, presence: true
end

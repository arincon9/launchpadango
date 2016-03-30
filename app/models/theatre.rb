class Theatre < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :showtime

  validates :number, uniqueness: true,
                     presence:   true

  validates :capacity, presence: true
end

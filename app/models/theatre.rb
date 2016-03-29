class Theatre < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :showtime

  validates :number, uniqueness:   true,
                     numericality: { only_integer: true },
                     presence:     true

  validates :capacity, numericality: { only_integer: true },
                       presence:     true
end

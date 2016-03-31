class Showtime < ActiveRecord::Base
  belongs_to :movie,   inverse_of: :showtimes
  belongs_to :theatre, inverse_of: :showtimes
  has_many   :orders,  inverse_of: :showtime

  validates :time, presence: true

  validate :time_not_in_past
  validate :capacity_is_available

  scope :upcoming, -> { where(<<-SQL) }
    time > '#{Time.now}'
    AND time < '#{Time.now + 2.weeks }'
  SQL

  scope :for_movie, ->(movie_id) { where(movie_id: movie_id) }

  def display_name
    time.strftime("%A, %b %d at %I:%M %p")
  end

  def time_not_in_past
    if time < Time.now
      errors.add(:time, "Show time must be set for a future date.")
    end
  end

  def capacity_is_available
    if sold_out?
      errors.add(:base, "This show is sold out.")
    end
  end

  def remaining_capacity
    theatre.capacity - orders.count
  end

  def sold_out?
    remaining_capacity.zero?
  end
end

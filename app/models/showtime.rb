class Showtime < ActiveRecord::Base
  belongs_to :movie,   inverse_of: :showtimes
  belongs_to :theatre, inverse_of: :showtimes
  has_many   :orders,  inverse_of: :showtime

  validates :time, presence: true

  validate :time_not_in_past

  scope :upcoming, -> { where(<<-SQL) }
    time > '#{Time.now}'
    AND time < '#{Time.now + 2.weeks }'
  SQL

  scope :for_movie, ->(movie_id) { where(movie_id: movie_id) }

  def display_name
    name = time.strftime("%A, %b %d at %I:%M %p")
    name << " (Sold Out)" if sold_out?
    name
  end

  def time_not_in_past
    if time < Time.now
      errors.add(:time, "Show time must be set for a future date.")
    end
  end

  def remaining_capacity
    theatre.capacity.to_i - orders_count
  end

  def sold_out?
    remaining_capacity <= 0
  end
end

class Showtime < ActiveRecord::Base
  belongs_to :movie, inverse_of: :showtimes
  belongs_to :theatre, inverse_of: :showtimes
  has_many :orders, inverse_of: :showtime

  validates :time, presence: true

  validate :ensure_theatre_uniqueness

  scope :upcoming, -> { where(<<-SQL) }
    time > '#{Time.now}'
    AND time < '#{Time.now + 2.weeks }'
  SQL

  scope :for_movie, ->(movie_id) { where(movie_id: movie_id) }

  def display_name
    time.strftime("%A, %b %d at %H:%M")
  end
end

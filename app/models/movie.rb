class Movie < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :movie
  has_many :orders, inverse_of: :movie

  validates :title,       presence:     true
  validates :description, presence:     true
  validates :runtime,     presence:     true,
                          numericality: { greater_than: 0}
end

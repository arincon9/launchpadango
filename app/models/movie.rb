class Movie < ActiveRecord::Base
  has_many :showtimes, dependent: :destroy, inverse_of: :movie
  has_many :orders, inverse_of: :movie

  validates :title,       presence:     true
  validates :description, presence:     true
  validates :runtime,     presence:     true,
                          numericality: { greater_than: 0}

  def self.from_imdb(imdb_record)
    new.tap do |movie|
      movie.imdb_id     = imdb_record[:imdb_id]
      movie.title       = imdb_record[:title]
      movie.description = imdb_record[:plot]
      movie.runtime     = imdb_record[:runtime]
      movie.rating      = imdb_record[:imdb_rating]
      movie.image_url   = imdb_record[:poster]
    end
  end
end

class ImdbInterface
  def self.find_movie(movie_id)
    Imdb::Movie.new(movie_id)
  end
end

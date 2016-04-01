class ImdbInterface
  def self.find_movie(movie_id)
    OMDB.id(movie_id)
  end
end

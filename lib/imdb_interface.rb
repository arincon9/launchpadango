class ImdbInterface
  def self.find_movie(id)
    record = Tmdb::Find.imdb_id(id)["movie_results"].first
    return unless record

    record.merge("imdb_id" => id,
                 "poster_path" => "http://image.tmdb.org/t/p/w600/#{record["poster_path"]}")
  end
end

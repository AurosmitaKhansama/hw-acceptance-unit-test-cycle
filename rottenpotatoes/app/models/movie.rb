class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.get_movies_same_director(director)
    @movies_same_director = Movie.where(:director => director).pluck(:title)
    return @movies_same_director
  end
end

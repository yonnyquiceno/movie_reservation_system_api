json.movies do
  json.array! @movies, partial: 'movie', as: :movie
end
json.next_available_movie_presentations_day @next_available_movie_presentations_day
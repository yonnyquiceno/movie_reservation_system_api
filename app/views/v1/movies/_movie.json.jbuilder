json.extract! movie, :id, :name, :description, :image_url
json.avilable_seats movie.reservations_on_day_count(params[:date]) < 10

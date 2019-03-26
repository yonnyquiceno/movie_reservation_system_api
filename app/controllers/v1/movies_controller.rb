module V1
  class MoviesController < ApplicationController
    require 'date_range_parser'
    before_action :ensure_date_provided, only: :index

    def index
      @movies = Movie.by_date(params[:date], params[:date])
      @next_available_movie_presentations_day = Movie.next_available_movie_presentations_day(params[:date] || Date.today)
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        render json: { message: 'Película guardada con éxito' }, status: :created
      else
        render json: { errors: @movie.errors.full_messages}, status: :unprocessable_entity
      end
    end

    private

    def movie_params
      @movie_params = params.require(:movie).permit(:name, :description, :image_url, :date_range)
      parse_date_range
    end

    def parse_date_range
      date_range_parser = DateRangeParser.new(@movie_params[:date_range])
      @movie_params.merge!(opening_date: date_range_parser.initial_date, closing_date: date_range_parser.final_date).except(:date_range)
    end

    def ensure_date_provided
      unless params[:date].present?
        render json: { errors: "Se debe proporcionar una fecha"}, status: :unprocessable_entity
      end
    end
  end
end

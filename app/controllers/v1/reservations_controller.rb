module V1
  class ReservationsController < ApplicationController
    require 'date_range_parser'
    def index
      @reservations = if params[:date_range].present?
        date_range_parser = DateRangeParser.new(params[:date_range])
        Reservation.includes(:user, :movie).by_date(date_range_parser.initial_date, date_range_parser.final_date).reverse
      else
        Reservation.includes(:user, :movie).all.reverse
      end
    end
  end
end
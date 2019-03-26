module V1
  class UsersController < ApplicationController
    def create
      @user = User.where(personal_id: user_params[:personal_id]).first_or_initialize
      @user.assign_attributes(user_params)
      @user.reservations.new(reservation_params)
      if @user.save
        render json: { message: 'Reservación guardada con éxito' }, status: :created
      else
        render json: { errors: @user.errors.map{|k,v| v}.join(', ') }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:cellphone, :personal_id, :email, :names)
    end

    def reservation_params
      params.require(:user).require(:reservation_attributes).permit([ :movie_id, :date ])
    end
  end
end

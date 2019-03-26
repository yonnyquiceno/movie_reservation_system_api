class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validate :validate_reservations_on_day
  validates :movie_id, presence: { message: "No existe película para el id proporcionado" }

  delegate :name, to: :movie, prefix: true
  delegate :names, :personal_id, :cellphone, :email, to: :user, prefix: true

  scope :by_date, -> (initial_date, final_date) { where('date >= ? AND date <= ?', initial_date.to_date, final_date.to_date) }

  private

  def validate_reservations_on_day
    unless movie.reservations_on_day_count(self.date) < 10
      errors.add(:reservations, "Lo sentimos, no quedan sillas disponibles para la película para la fecha #{self.date}")
    end
  end
end

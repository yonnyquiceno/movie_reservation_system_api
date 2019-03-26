class Movie < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: { message: "Título requerido" }
  validates :description, presence: { message: "Descripción requerida" }
  validates :image_url, presence: { message: "Url de imagen requerida" }
  validates :opening_date, presence: { message: "fecha de apertura requerida" }
  validates :closing_date, presence: { message: "fecha de cierre requerida" }

  scope :by_date, -> (initial_date, final_date) { where('opening_date <= ? AND closing_date >= ?', initial_date.to_date, final_date.to_date) }

  def self.next_available_movie_presentations_day(date)
    where('opening_date > ?', date).order(:opening_date).pluck(:opening_date).first
  end

  def reservations_on_day_count(date)
    reservations.where(date: date).count
  end
end
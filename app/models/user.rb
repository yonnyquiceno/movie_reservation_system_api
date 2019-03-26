class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :movies, through: :reservations
  accepts_nested_attributes_for :reservations

  validates :names, presence: { message: "Porfavor propociona tu numbre completo" }
  validates :personal_id, presence: { message: "Porfavor proporciona tu número de cédula" }
  validates :personal_id, numericality: { only_integer: true, message: "Tu número de cédula debe ser un número entero" }
  validates :email, presence: { message: "Porfavor proporciona tu correo electrónico" }
end


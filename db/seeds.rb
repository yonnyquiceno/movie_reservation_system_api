# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require 'faker'

  9.times do |i|
    3.times do
      Movie.create(
        name: Faker::Lorem.paragraph(2),
        image_url: Faker::LoremPixel.image("300x600", false, 'technics', rand(1..10)),
        description: Faker::Lorem.paragraph(2, false, 4),
        opening_date: Date.today + (i * 3).days,
        closing_date: Date.today + (i * 3).days + 1.week
      )
    end
  end

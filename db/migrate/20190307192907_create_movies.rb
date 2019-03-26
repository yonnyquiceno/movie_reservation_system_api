class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.date :opening_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.date :closing_date, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end

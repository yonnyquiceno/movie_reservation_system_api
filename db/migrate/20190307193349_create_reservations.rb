class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.date :date, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end

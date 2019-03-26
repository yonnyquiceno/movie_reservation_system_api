class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :cellphone, :limit => 8
      t.integer :personal_id, :limit => 8
      t.string :email
      t.string :names

      t.timestamps
    end
  end
end

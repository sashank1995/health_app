class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :medicine
      t.string :food
      t.string :activities
      t.integer :disease_id

      t.timestamps null: false
    end
  end
end

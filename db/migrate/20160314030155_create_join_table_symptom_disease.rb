class CreateJoinTableSymptomDisease < ActiveRecord::Migration
  def change
    create_join_table :symptoms, :diseases do |t|
      # t.index [:symptom_id, :disease_id]
      # t.index [:disease_id, :symptom_id]
    end
  end
end

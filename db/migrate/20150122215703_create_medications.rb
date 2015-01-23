class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :medication_name
      t.integer :medication_dosage

      t.timestamps null: false
    end
  end
end

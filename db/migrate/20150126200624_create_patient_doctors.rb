class CreatePatientDoctors < ActiveRecord::Migration
  def change
    create_table :patient_doctors do |t|
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end

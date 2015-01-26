class CreateHospitalDoctors < ActiveRecord::Migration
  def change
    create_table :hospital_doctors do |t|
      t.integer :hospital_id
      t.integer :doctor_id

      t.timestamps null: false
    end
  end
end

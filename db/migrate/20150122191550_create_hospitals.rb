class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :hospital_name

      t.timestamps null: false
    end
  end
end

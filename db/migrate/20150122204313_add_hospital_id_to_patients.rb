class AddHospitalIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :hospital_id, :string
  end
end

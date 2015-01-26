class Doctor < ActiveRecord::Base
  has_many :patients, through: :patient_doctors
  has_many :hospitals, through: :hospital_doctors
  has_many :patient_doctors
  has_many :hospital_doctors
  has_many :ratings, as: :ratable
end

class Medication < ActiveRecord::Base
  has_many :patients, through: :patient_medications
  has_many :patient_medications
end

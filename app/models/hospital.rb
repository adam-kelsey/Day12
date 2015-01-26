class Hospital < ActiveRecord::Base
  has_many :patients, dependent: :destroy
  has_many :hospital_doctors
  has_many :doctors, through: :hospital_doctors
  has_many :ratings, as: :ratable
  # has_many :medications, through: :patients
end

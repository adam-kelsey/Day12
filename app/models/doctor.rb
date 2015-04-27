class Doctor < ActiveRecord::Base
  has_many :patients, through: :patient_doctors
  has_many :hospitals, through: :hospital_doctors
  has_many :patient_doctors
  has_many :hospital_doctors
  has_many :ratings, as: :ratable

  # def self.search(search)
  #   if !params[:q].blank?
  #       @doctors = Doctor.where("name LIKE ? OR practice LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
  #   else
  #     @doctors = Doctor.all
  #   end
  # end
end

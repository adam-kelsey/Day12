class SearchesController < ApplicationController
  def index
    if !params[:q].blank?
      @doctors = Doctor.where("name LIKE ? OR practice LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
      @hospitals = Hospital.where("hospital_name LIKE ?", "%#{params[:q]}%")
      @medications = Medication.where("medication_name LIKE ?", "%#{params[:q]}%")
      @patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR description LIKE ? OR dob LIKE ? OR gender LIKE ? OR bloodtype LIKE ? AND hospital_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "params[:hospital_id")
    else
      @doctors = Doctor.all
      @medications = Medication.all
      @hospitals = Hospital.all
      @patients = Patient.all
    end

    # @patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR description LIKE ? OR dob LIKE ? OR gender LIKE ? OR bloodtype LIKE ? AND hospital_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "params[:hospital_id")
    respond_to do |format|
      format.js
      format.html
    end
  end
end

class SearchesController < ApplicationController
  def index
    # @doctors = Doctor.search(params[:search])
    # @hospitals = Hospital.search(params[:search])
    # @patients = Patient.search(params[:search])
    # @medications = Medication.search(params[:search])
    if !params[:q].blank?
      @doctors = Doctor.where("name LIKE ? OR practice LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @doctors = Doctor.all
    end
    if !params[:q].blank?
      @hospitals = Hospital.where("hospital_name LIKE ?", "%#{params[:q]}%")
    else
      @hospitals = Hospital.all
    end
    if !params[:q].blank?
      @medications = Medication.where("medication_name LIKE ?", "%#{params[:q]}%")
    else
      @medications = Medication.all
    end
    if @patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR description LIKE ? OR dob LIKE ? OR gender LIKE ? OR bloodtype LIKE ? AND hospital_id = ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "params[:hospital_id")
    respond_to do |format|
      format.js
      format.html
    end
  end
end

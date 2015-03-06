class DoctorsController < ApplicationController
  def index
    if !params[:q].blank?
      @doctors = Doctor.where("name LIKE ? OR practice LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @doctors = Doctor.all
    end
  end

  def new
    @doctor = Doctor.new
    @patients = Patient.all
    @hospitals = Hospital.all
  end

  def create
    @doctor = Doctor.create doctor_params
    redirect_to doctors_path
  end

  def create_rating
    @doctor = Doctor.find params[:id]
    @rating = @doctor.ratings.create rating_params
    redirect_to doctor_path(@doctor)
  end

  def show
    @rating = Rating.new
    @doctor = Doctor.find params[:id]
    @ratings = @doctor.ratings
  end

  def edit
    @doctor = Doctor.find params[:id]
    @patients = Patient.all
    @hospitals = Hospital.all
  end

  def update
    @doctor = Doctor.find params[:id]
    @doctor.update_attributes doctor_params
    redirect_to doctor_path(@doctor)
  end

  def destroy
    @doctor = Doctor.find params[:id]
    @doctor.delete
    redirect_to doctors_path
  end

  private
  def doctor_params
    params.require(:doctor).permit(
      :name,
      :practice,
      :doctorable_id,
      :doctorable_type,
      doctor_ids: [],
      hospital_ids: []
    )
  end

  def rating_params
    params.require(:rating).permit(
      :score,
      :comment,
      :ratable_id,
      :ratable_type
    )
  end
end

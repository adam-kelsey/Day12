class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.create doctor_params
    redirect_to doctor_path(@doctor)
  end

  def show
    @doctor = Doctor.find params[:id]
  end

  def edit
    @doctor = Doctor.find params[:id]
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
      :doctorable_type
    )
  end
end

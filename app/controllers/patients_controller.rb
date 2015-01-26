class PatientsController < ApplicationController
  def index
    @hospital = Hospital.find params[:hospital_id]
    @patients = @hospital.patients
  end

  def new
    # @doctors = @patient.doctors
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.create patient_params
    if @patient.save
      flash[:notice] = 'Patient was successfully created'
      redirect_to hospital_patients_path
    else
      flash[:error] = 'Patient was NOT saved.'
      render :new
    end
  end

  def show
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @doctors = @patient.doctors
  end

  def edit
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    # @doctors = @patient.doctors
  end

  def update
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @patient.update_attributes patient_params
    redirect_to hospital_patients_path
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @patient.destroy
    redirect_to hospital_patients_path
  end

  private
  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :description,
      :gender,
      :bloodtype
      )
  end
end

class MedicationsController < ApplicationController
  def index
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medications = @patient.medications
  end

  def new
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.new
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.create medication_params
    redirect_to hospital_patient_medications_path
  end

  def show
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
  end

  def edit
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
  end

  def update
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
    @medication.update_attributes medication_params
    redirect_to hospital_patient_medication_path
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:patient_id]
    @medication = @patient.medications.find params[:id]
    @medication.destroy
    redirect_to hospital_patient_medications_path
  end

  private
  def medication_params
    params.require(:medication).permit(
      :medication_name,
      :medication_dosage
      )
  end
end

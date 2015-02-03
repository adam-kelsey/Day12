class MedicationsController < ApplicationController
  def index
    if !params[:q].blank?
      @medications = Medication.where("medication_name LIKE ?", "%#{params[:q]}%")
    else
      @medications = Medication.all
    end
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medications = @patient.medications
  end

  def new
    @medication = Medication.new
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.new
  end

  def create
    @medication = Medication.create medication_params
    redirect_to medications_path
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.create medication_params
    # redirect_to hospital_patient_medications_path
  end

  def show
    @medication = Medication.find params[:id]
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.find params[:id]
  end

  def edit
    @medication = Medication.find params[:id]
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.find params[:id]
  end

  def update
    @medication = Medication.find params[:id]
    @medication.update_attributes medication_params
    redirect_to medication_path
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.find params[:id]
    # @medication.update_attributes medication_params
    # redirect_to hospital_patient_medication_path
  end

  def destroy
    @medication = Medication.find params[:id]
    @medication.destroy
    redirect_to medications_path
    # @hospital = Hospital.find params[:hospital_id]
    # @patient = @hospital.patients.find params[:patient_id]
    # @medication = @patient.medications.find params[:id]
    # @medication.destroy
    # redirect_to hospital_patient_medications_path
  end

  private
  def medication_params
    params.require(:medication).permit(
      :medication_name,
      :medication_dosage
      )
  end
end

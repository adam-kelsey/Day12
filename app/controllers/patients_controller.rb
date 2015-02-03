class PatientsController < ApplicationController
  before_action :set_patient, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :waiting_room_patient,
    :checkup_patient,
    :xray_patient,
    :surgery_patient,
    :bill_pay_patient,
    :discharge_patient
  ]
  def index
    if !params[:q].blank?
      @patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR description LIKE ? OR dob LIKE ? OR gender LIKE ? OR bloodtype LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      @patients = Patient.all
    end
    @hospital = Hospital.find params[:hospital_id]
    # @patients = @hospital.patients
  end

  def new
    # @doctors = @patient.doctors
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.new
    @medications = Medication.all
  end

  def create
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.create patient_params
    @medications = Medication.all
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
    @doctors = @patient.doctors
    @medications = Medication.all
  end

  def update
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @patient.update_attributes patient_params
    @medications = Medication.all
    redirect_to hospital_patients_path
  end

  def destroy
    @hospital = Hospital.find params[:hospital_id]
    @patient = @hospital.patients.find params[:id]
    @patient.destroy
    redirect_to hospital_patients_path
  end

  def waiting_room_patient
    @patient.wait!
    redirect_to hospital_patients_path
  end

  def checkup_patient
    @patient.exam!
    redirect_to hospital_patients_path
  end

  def xray_patient
    @patient.scan!
    redirect_to hospital_patients_path
  end

  def surgery_patient
    @patient.operation!
    redirect_to hospital_patients_path
  end

  def bill_pay_patient
    @patient.pay!
    redirect_to hospital_patients_path
  end

  def discharge_patient
    @patient.leave!
    redirect_to hospital_patients_path
  end

  private
  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :description,
      :gender,
      :bloodtype,
      medication_ids: []
      )
  end
end

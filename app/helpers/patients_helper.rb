module PatientsHelper
  def patient_current_state?(patient_object)
    patient_object.workflow_state
  end
end

module PatientsHelper
  def patient_current_state?(patient_object)
    patient_object.workflow_state
  end

  def is_patient_waiting_room?(patient_object)
    patient_object.current_state
  end
end

require 'rails_helper'

describe 'toggle workflow states of patients', type: :feature, js: true do
  let (:hospital) do
    Hospital.create({
      hospital_name: "Hello"
    })
  end
  let (:patient) do
    Patient.create({
      first_name: "David",
      last_name: "Kelsey",
      gender: "Male",
      description: "Hi",
      bloodtype: "A+",
      hospital: hospital
    })
  end
  it 'should toggle the workflow state of the current patient' do
    visit hospital_patient_path(patient.hospital, patient)
    find('.checkup-patient').click
    find('.xray-patient').click
    find('.waitingroom-patient').click
  end
end


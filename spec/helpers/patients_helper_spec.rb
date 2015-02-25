require 'rails_helper'

RSpec.describe PatientsHelper, type: :helper do
  subject do
    Patient.new({
      first_name: "Some first name",
      last_name: "Some last name",
      dob: "a date of birth",
      description: "totally awesome",
      gender: "male or female",
      bloodtype: "too many to count"
    })
  end

  it 'should return whether a patient is in the waiting room or not' do
    expect(helper.is_patient_waiting_room?(subject)).to eq("waiting_room")
  end
end
require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject do
    Patient.new({
      first_name: "Some first name",
      last_name: "Some last name",
      dob: "Some birth date",
      description: "Some Description",
      gender: "male or female",
      bloodtype: "lots of them"
    })
  end

  it "should have a name" do
    patient = Patient.new
    patient.first_name = "Adam's Name"
    expect(patient.first_name).to eq("Adam's Name")
  end

  it "should NOT have a name" do
    patient = Patient.new
    expect(patient.first_name).not_to eq("Adam's Name")
  end

  it "should NOT have a name" do
    patient = Patient.new
    patient.first_name = "Adams Name"
    expect(patient.first_name).not_to eq(nil)
  end

  it "should have a last name" do
    patient = Patient.new
    patient.last_name = "Adams last name"
    expect(patient.last_name).to eq("Adams last name")
  end

  it "should NOT have a last name" do
    patient = Patient.new
    expect(patient.last_name).not_to eq("Adams last name")
  end

  it "should NOT have a last name" do
    patient = Patient.new
    patient.last_name = "Adams last name"
    expect(patient.last_name).not_to eq(nil)
  end

  it "should have a gender" do
    patient = Patient.new
    patient.gender = "male or female"
    expect(patient.gender).to eq("male or female")
  end

  it "should have a gender" do
    patient = Patient.new
    patient.gender = "male or female"
    expect(patient.gender).not_to eq(nil)
  end

  it "should validate when we do not have a name" do
    no_first_name = Patient.new
    expect(no_first_name.valid?).to eq(false)
    expect(no_first_name.errors).to include(:first_name)
    expect(no_first_name.errors.full_messages).to include("First name can't be blank")
  end


  it "should validate when we create" do
    no_first_name = Patient.new
    expect(no_first_name.errors).not_to include(:first_name)
    no_first_name.save
    expect(no_first_name.errors).to include(:first_name)
    expect(no_first_name.errors.full_messages).to include("First name can't be blank")
  end

  it "should start in the state of waiting_room" do
    expect(subject.current_state).to eq("waiting_room")
  end

  it "should be able to transfer to 5 states from waiting_room" do
    expect(subject.current_state.events.keys).to eq([
      :wait,
      :exam,
      :scan,
      :operation,
      :leave
    ])
  end
end
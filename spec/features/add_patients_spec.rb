require 'rails_helper'


describe 'Add patient' do
  subject do
    FactoryGirl.create(:hospital)
  end
  it "should add a patient successfully" do
    visit hospital_patients_path(subject)
    click_link 'Add Patient'
    fill_in 'First name', with: 'David'
    fill_in 'Last name', with: 'Adam'
    select('1996', :from => 'patient_dob_1i')
    select('February', :from => 'patient_dob_2i')
    select('25', :from => 'patient_dob_3i')
    fill_in 'Description', with: "Super awesome"
    choose('patient_gender_male')
    select('A+', :from => 'Bloodtype')
    click_button 'Submit'
  end
end

describe 'Add hospital' do
  it "should add a hospital successfully" do
    visit root_path
    click_link "Add Hospital"
    fill_in 'Hospital name', with: 'Test Hospital'
    click_button 'Create Hospital'
    expect(page).to have_content("List of Hospitals")
    expect(page).to have_content("Add Hospital")
    expect(page).to have_content("List of Medications")
    expect(page).to have_content("Add Medication")
    expect(page).to have_content("Home")
    expect(page).to have_content("Doctors")
  end
end
  
describe 'Add Doctor' do
  it "should successfully add a doctor" do
    visit root_path
    click_link 'Doctors'
    click_link 'Add Doctor'
    fill_in 'Name', with: 'Adam Kelsey'
    fill_in 'Practice', with: 'Cardiology'
    click_button 'Create Doctor'
    expect(page).to have_content("Doctor Information")
    expect(page).to have_content("Adam Kelsey")
    expect(page).to have_content("Cardiology")
  end
end

describe 'Add Medication' do
  it "should successfully add a medication" do
    visit root_path
    click_link 'Add Medication'
    fill_in 'Medication name', with: 'Zoloft'
    fill_in 'Medication dosage', with: '100mg'
    click_button 'Create Medication'
  end
end
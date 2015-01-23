class HomeController < ApplicationController
  def index
    @patients = Patient.all
    @hospitals = Hospital.all
    @medications = Medication.all
  end
end

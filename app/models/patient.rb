class Patient < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate :at_least_10
  def at_least_10

    if self.dob
      errors.add(:dob, 'you must be 10 years or older.') if self.dob > 10.years.ago.to_date
    end
  end
  validates :description, presence: true
  validates :gender, presence: true
  validates :bloodtype, presence: true

  BLOODTYPE_OPTIONS = [
    ["A+", "A+"],
    ["A-", "A-"],
    ["B+", "B+"],
    ["B-", "B-"],
    ["AB+", "AB+"],
    ["AB-", "AB-"],
    ["O+", "O+"],
    ["O-", "O-"]
  ]

  has_many :doctors, through: :patient_doctors
  has_many :patient_doctors
  has_many :medications, through: :patient_medications
  has_many :patient_medications
  belongs_to :hospital
  has_many :medications, dependent: :destroy

    # :waiting_room_patient,
    # :checkup_patient,
    # :xray_patient,
    # :surgery_patient,
    # :bill_pay_patient,
    # :discharge_patient

  include Workflow
  workflow do
    state :waiting_room do
      event :wait, transitions_to: :waiting_room
      event :exam, transitions_to: :checkup
      event :scan, transitions_to: :xray
      event :operation, transitions_to: :surgery
      event :leave, transitions_to: :discharge
    end

    state :checkup do
      event :exam, transitions_to: :checkup
      event :wait, transitions_to: :waiting_room
      event :scan, transitions_to: :xray
      event :operation, transitions_to: :surgery
      event :pay, transitions_to: :bill_pay
      event :leave, transitions_to: :discharge
    end

    state :xray do
      event :scan, transitions_to: :xray
      event :wait, transitions_to: :waiting_room
      event :exam, transitions_to: :checkup
      event :operation, transitions_to: :surgery
      event :pay, transitions_to: :bill_pay
      event :leave, transitions_to: :discharge
    end

    state :surgery do
      event :operation, transitions_to: :surgery
      event :scan, transitions_to: :xray
      event :wait, transitions_to: :waiting_room
      event :exam, transitions_to: :checkup
      event :pay, transitions_to: :bill_pay
      event :leave, transitions_to: :discharge
    end

    state :bill_pay do
      event :pay, transitions_to: :bill_pay
      event :leave, transitions_to: :discharge
    end

    state :discharge do
      event :leave, transitions_to: :discharge
    end
  end
end


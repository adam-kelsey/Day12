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

  belongs_to :hospital
  has_many :medications, dependent: :destroy
end


class Doctor < ActiveRecord::Base
  belongs_to :patients, polymorphic: true
  belongs_to :hospitals, polymorphic: true
end

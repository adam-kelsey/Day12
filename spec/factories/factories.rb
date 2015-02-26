FactoryGirl.define do
  factory :hospital do
    hospital_name "Mercy Hospital"
  end

  factory :patient do
    first_name "David"
    last_name "Kelsey"
    description "awesome"
    gender "male"
    bloodtype "A+"
    hospital FactoryGirl.create(:hospital)
  end

end
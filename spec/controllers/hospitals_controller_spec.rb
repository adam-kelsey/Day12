require 'rails_helper'

describe HospitalsController do
  let(:hospital) {
    Hospital.create({hospital_name: "Hello"})
  }

  describe 'GET #index' do
    let!(:hospital1) {
      Hospital.create({hospital_name: "Allo"})
    }

    let!(:hospital2) {
      Hospital.create({hospital_name: "Alto"})
    }

    let!(:hospital3) {
      Hospital.create({hospital_name: "Altic"})
    }

    it 'should return only 1 hospital' do
      get :index, q: 'Altic'
      expect(assigns(:hospitals)).not_to eq(nil)
      expect(assigns(:hospitals)).to eq([hospital3])
    end

    #when doing q: 'A', test will not pass unless all hospitals in !let begin with A. When attempted with names of hospitals being "Hello, Allo, and Arctic", test failed. To use .include all hospitals must have same "variable" in common?

    it 'should return all 3 hospitals' do
      get :index, q: 'A'
      expect(assigns(:hospitals)).not_to eq(nil)
      expect(assigns(:hospitals)).to include(hospital1)
      expect(assigns(:hospitals)).to include(hospital2)
      expect(assigns(:hospitals)).to include(hospital3)
      expect(assigns(:hospitals).length).to eq(3)
    end

    it 'should return all hospitals' do
      get :index, q: ""
      expect(assigns(:hospitals)).not_to eq(nil)
      expect(assigns(:hospitals)).to include(hospital1)
      expect(assigns(:hospitals)).to include(hospital2)
      expect(assigns(:hospitals)).to include(hospital3)
      expect(assigns(:hospitals).length).to eq(3)
    end

    it 'should return all hospitals' do
      get :index
      expect(assigns(:hospitals)).not_to eq(nil)
      expect(assigns(:hospitals)).to include(hospital1)
      expect(assigns(:hospitals)).to include(hospital2)
      expect(assigns(:hospitals)).to include(hospital3)
      expect(assigns(:hospitals).length).to eq(3)
    end
  end

  describe 'GET #new' do
    it 'should initialize a new hospital' do
      get :new
      expect(assigns(:hospital).new_record?).to eq(true)
      expect(assigns(:hospital).class).to eq Hospital
      expect(assigns(:doctors).class).to eq(Doctor::ActiveRecord_Relation)
      expect(assigns(:doctors)).to eq([])
    end
  end

  describe 'POST #create' do
    it 'should create a new hospital' do
      expect {
        post :create, id: hospital, hospital: { hospital_name: "Mercy" }
      }.to change(Hospital, :count).by(2)
      expect(response).to redirect_to root_path
    end
  end

  describe 'POST #create_rating' do
    it 'should create a rating for the hospital' do
      post :create_rating, id: hospital, rating: { score: "100", comment: "supfoo" }
      expect(assigns(:hospital)).to eq hospital
      expect(assigns(:rating).class).to eq Rating
      expect(assigns(:rating).ratable_id).to eq hospital.id
      expect(assigns(:rating).ratable_type).to eq "Hospital"
      expect(response).to redirect_to hospital_path(hospital)
    end
  end

  describe 'GET #show' do
    it 'should show a hospital object' do
      get :show, id: hospital
      expect(assigns(:hospital)).to eq hospital
      expect(assigns(:doctors).class).to eq(Doctor::ActiveRecord_Associations_CollectionProxy)
      expect(assigns(:doctors)).to eq([])
    end
  end

  describe 'GET #edit' do
    it 'should edit a hospital' do
      get :edit, id: hospital
      expect(assigns(:hospital)).to eq hospital
      expect(assigns(:doctors).class).to eq(Doctor::ActiveRecord_Relation)
      expect(assigns(:doctors)).to eq([])
    end
  end

  # describe "PUT update/:id" do
  #   it 'should update hospital' do
  #     hospital_params = hospital 
  #     patch :update, id: hospital
  #   end
  # end



  describe "PUT update/:id" do
    let(:attr) do
      { :hospital_name => 'mercy' }
    end

    before(:each) do
      put :update, id: hospital, :hospital => attr
      hospital.reload
    end

    it 'should do stuff' do
      hospital.reload
      expect(hospital.hospital_name).to eq 'mercy'
      expect(response).to redirect_to root_path
    end
  end


  describe 'DELETE #destroy' do
    it 'should delete a hospital' do
      hospital
      expect{
        delete :destroy, id: hospital
      }
      .to change(Hospital, :count).by(-1)
      expect(response).to redirect_to root_path
    end
  end


end
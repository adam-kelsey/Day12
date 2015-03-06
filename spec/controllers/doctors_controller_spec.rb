require 'rails_helper'

describe DoctorsController do
  let(:doctor) {
    Doctor.create({name: "Josh Harvey"})
  }

  describe 'GET #index' do
    let!(:doctor1) {
      Doctor.create({name: "Josh Harvey"})
    }

    let!(:doctor2) {
      Doctor.create({name: "John Harvey"})
    }

    let!(:doctor3) {
      Doctor.create({name: "Jay Harvey"})
    }

    it 'should return only 1 doctor' do
      get :index, q: 'Jay'
      expect(assigns(:doctors)).not_to eq(nil)
      expect(assigns(:doctors)).to eq([doctor3])
    end

    it 'should return all 3 doctors' do
      get :index, q: 'Harvey'
      expect(assigns(:doctors)).not_to eq(nil)
      expect(assigns(:doctors)).to include(doctor1)
      expect(assigns(:doctors)).to include(doctor2)
      expect(assigns(:doctors)).to include(doctor3)
      expect(assigns(:doctors).length).to eq(3)
    end

    it 'should return all doctors' do
      get :index, q: ""
      expect(assigns(:doctors)).not_to eq(nil)
      expect(assigns(:doctors)).to include(doctor1)
      expect(assigns(:doctors)).to include(doctor2)
      expect(assigns(:doctors)).to include(doctor3)
      expect(assigns(:doctors).length).to eq(3)
    end

    it 'should return all doctors' do
      get :index
      expect(assigns(:doctors)).not_to eq(nil)
      expect(assigns(:doctors)).to include(doctor1)
      expect(assigns(:doctors)).to include(doctor2)
      expect(assigns(:doctors)).to include(doctor3)
      expect(assigns(:doctors).length).to eq(3)
    end
  end

  describe 'GET #new' do
  it 'should initialize a new doctor' do
    get :new
    expect(assigns(:doctor).new_record?).to eq(true)
    expect(assigns(:doctor).class).to eq Doctor
    end
  end

  describe 'POST #create' do
    it 'should create a new doctor' do
      expect {
        post :create, id: doctor, doctor: { name: "Josh Harvey" }
      }.to change(Doctor, :count).by(2)
      expect(response).to redirect_to doctors_path
    end
  end

  describe 'GET #show' do
    it 'should show a doctor object' do
      get :show, id: doctor
      expect(assigns(:doctor)).to eq doctor
    end
  end

  describe 'GET #edit' do
    it 'should edit a doctor' do
      get :edit, id: doctor
      expect(assigns(:doctor)).to eq doctor
    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { :name => 'Josh Harvey' }
    end

    before(:each) do
      put :update, id: doctor, :doctor => attr
      doctor.reload
    end

    it 'should do stuff' do
      doctor.reload
      expect(doctor.name).to eq 'Josh Harvey'
      expect(response).to redirect_to doctor_path
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a doctor' do
      doctor
      expect{
        delete :destroy, id: doctor
      }
      .to change(Doctor, :count).by(-1)
      expect(response).to redirect_to doctors_path
    end
  end


end
require 'rails_helper'

describe MedicationsController do
  let(:medication) {
    Medication.create({medication_name: "Zoloft"})
  }

  describe 'GET #index' do
    let!(:medication1) {
      Medication.create({medication_name: "Siric100"})
    }

    let!(:medication2) {
      Medication.create({medication_name: "Siric200"})
    }

    let!(:medication3) {
      Medication.create({medication_name: "Siric300"})
    }

    it 'should return only 1 medication' do
      get :index, q: 'Siric100'
      expect(assigns(:medications)).not_to eq(nil)
      expect(assigns(:medications)).to eq([medication1])
    end

    it 'should return all 3 medications' do
      get :index, q: '00'
      expect(assigns(:medications)).not_to eq(nil)
      expect(assigns(:medications)).to include(medication1)
      expect(assigns(:medications)).to include(medication2)
      expect(assigns(:medications)).to include(medication3)
      expect(assigns(:medications).length).to eq(3)
    end

    it 'should return all medications' do
      get :index, q: ""
      expect(assigns(:medications)).not_to eq(nil)
      expect(assigns(:medications)).to include(medication1)
      expect(assigns(:medications)).to include(medication2)
      expect(assigns(:medications)).to include(medication3)
      expect(assigns(:medications).length).to eq(3)
    end

    it 'should return all medications' do
      get :index
      expect(assigns(:medications)).not_to eq(nil)
      expect(assigns(:medications)).to include(medication1)
      expect(assigns(:medications)).to include(medication2)
      expect(assigns(:medications)).to include(medication3)
      expect(assigns(:medications).length).to eq(3)
    end
  end

  describe 'GET #new' do
  it 'should initialize a new medication' do
    get :new
    expect(assigns(:medication).new_record?).to eq(true)
    expect(assigns(:medication).class).to eq Medication
    end
  end

  describe 'POST #create' do
    it 'should create a new medication' do
      expect {
        post :create, id: medication, medication: { medication_name: "Welbutrin" }
      }.to change(Medication, :count).by(2)
      expect(response).to redirect_to medications_path
    end
  end

  describe 'GET #show' do
    it 'should show a medication object' do
      get :show, id: medication
      expect(assigns(:medication)).to eq medication
    end
  end

  describe 'GET #edit' do
    it 'should edit a medication' do
      get :edit, id: medication
      expect(assigns(:medication)).to eq medication
    end
  end

  describe "PUT update/:id" do
    let(:attr) do
      { :medication_name => 'zoloft' }
    end

    before(:each) do
      put :update, id: medication, :medication => attr
      medication.reload
    end

    it 'should do stuff' do
      medication.reload
      expect(medication.medication_name).to eq 'zoloft'
      expect(response).to redirect_to medication_path
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete a medication' do
      medication
      expect{
        delete :destroy, id: medication
      }
      .to change(Medication, :count).by(-1)
      expect(response).to redirect_to medications_path
    end
  end


end
require 'doc_office_spec'

describe 'patient' do

  it 'initializes with a hash' do
    new_patient = Patient.new({:name=>'Joe', :birthdate=>'1960-05-12'})
    expect(new_patient).to be_an_instance_of Patient
  end

  describe '.all' do
    it 'returns a blank array' do
      expect(Patient.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a patient' do
      new_patient = Patient.new({:name=>'Joe', :birthdate=>'1960-05-12'})
      new_patient.save
      expect(Patient.all[0]).to eq new_patient
    end
  end

  describe 'assign_doctor' do
    it 'assigns a patient to a doctor' do
      new_doctor = Doctor.new({:name=>'Joe', :specialty=>1})
      new_doctor.save
      new_patient = Patient.new({:name=>'Joe', :birthdate=>'1960-05-12'})
      new_patient.save
      new_patient.assign_doctor(new_doctor.id)
      expect(new_patient.doctor_id).to eq new_doctor.id
    end
  end

  describe 'remove' do
    it 'removes a patient' do
      new_patient = Patient.new({:name=>'Joe'})
      new_patient.save
      new_patient.remove
      expect(Patient.all).to eq []
    end
  end

end


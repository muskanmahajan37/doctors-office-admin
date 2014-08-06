require 'doc_office_spec'

describe 'Doctor' do
  it 'initializes with a hash' do
    new_doctor = Doctor.new({:name=>'Joe', :specialty=>'Gynecologist', :id=>nil})
    expect(new_doctor).to be_an_instance_of Doctor
  end

  describe '.all' do
    it 'starts as a blank array' do
      expect(Doctor.all).to eq []
    end
  end

  it 'saves doctors' do
    new_doctor = Doctor.new({:name=>'Joe', :specialty=>'Gynecologist', :id=>nil})
    new_doctor.save
    expect(Doctor.all[0]).to eq new_doctor
  end
end

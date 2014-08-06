require 'doc_office_spec'

describe 'patient' do

  it 'initializes with a hash' do
    new_patient = Patient.new({:name=>'Joe', :birthdate=>'1960/05/12'})
    expect(new_patient).to be_an_instance_of Patient
  end

  describe '.all' do
      it 'returns a blank array' do
      expect(Patient.all).to eq []
    end
  end

end


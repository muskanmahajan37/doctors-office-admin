require 'doc_office_spec'

describe 'Doctor' do
  it 'initializes with a hash' do
    new_doctor = Doctor.new({:name=>'Joe', :specialty=>1})
    expect(new_doctor).to be_an_instance_of Doctor
  end

  describe '.all' do
    it 'starts as a blank array' do
      expect(Doctor.all).to eq []
    end
  end

  describe 'save' do
    it 'saves doctors' do
      new_doctor = Doctor.new({:name=>'Joe', :specialty=>1})
      new_doctor.save
      expect(Doctor.all[0]).to eq new_doctor
    end
  end

  describe 'edit_specialty' do
    it 'gives a doctor a new specialty' do
      new_doctor = Doctor.new({:name=>'Joe', :specialty=>1})
      new_doctor.save
      new_doctor.edit_specialty(2)
      expect(new_doctor.specialty).to eq 2
    end
  end

  describe '.list_by_specialty' do
    it 'lists all doctors with a given specialty' do
      new_doctor1 = Doctor.new({:name=>'Joe'})
      new_doctor1.save
      new_doctor1.edit_specialty(1)
      new_doctor2 = Doctor.new({:name=>'Jim'})
      new_doctor2.save
      new_doctor2.edit_specialty(2)
      new_doctor3 = Doctor.new({:name=>'Jet'})
      new_doctor3.save
      new_doctor3.edit_specialty(2)
      expect(Doctor.list_by_specialty(2)).to eq [new_doctor2, new_doctor3]
    end
  end

  describe 'edit_insurance' do
    it 'changes doctor insurance' do
      new_doctor = Doctor.new({:name=>'Joe', :specialty=>1})
      new_doctor.save
      new_doctor.edit_insurance(1)
      expect(new_doctor.insurance).to eq 1
    end
  end

  describe '.list_by_insurance' do
    it 'lists all doctors that accept given insurance' do
      new_doctor1 = Doctor.new({:name=>'Joe'})
      new_doctor1.save
      new_doctor1.edit_insurance(1)
      new_doctor2 = Doctor.new({:name=>'Jim'})
      new_doctor2.save
      new_doctor2.edit_insurance(1)
      new_doctor3 = Doctor.new({:name=>'Jet'})
      new_doctor3.save
      new_doctor3.edit_insurance(2)
      expect(Doctor.list_by_insurance(1)).to eq [new_doctor1, new_doctor2]
    end
  end
end

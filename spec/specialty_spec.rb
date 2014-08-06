require 'doc_office_spec'

describe 'Specialty' do
  it 'initializes with a hash' do
    new_specialty = Specialty.new({:name=>'Orthopedic'})
    expect(new_specialty).to be_an_instance_of Specialty
  end

  describe '.all' do
    it 'returns an empty array to start' do
      expect(Specialty.all).to eq []
    end
  end

  describe 'save' do
    it 'saves a new specialty' do
      new_specialty1 = Specialty.new({:name=>'Orthopedic'})
      new_specialty1.save
      new_specialty2 = Specialty.new({:name=>'Gynecologist'})
      new_specialty2.save
      new_specialty3 = Specialty.new({:name=>'Cardiovascular'})
      new_specialty3.save
      expect(Specialty.all).to eq [new_specialty1, new_specialty2, new_specialty3]
    end
  end

  describe 'remove' do
    it 'removes a specialty' do
      new_specialty = Specialty.new({:name=>'Orthopedic'})
      new_specialty.save
      new_specialty.remove
      expect(Specialty.all).to eq []
    end
  end
end

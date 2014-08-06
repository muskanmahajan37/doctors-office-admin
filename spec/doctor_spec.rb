require 'rspec'
require 'doctor'

describe 'Doctor' do
  it 'initializes with a hash' do
    new_doctor = Doctor.new({:name=>'Joe', :specialty=>'Gynecologist'})
    expect(new_doctor).to be_an_instance_of Doctor
  end
end

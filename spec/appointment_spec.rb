require 'doc_office_spec'

describe 'Appointment' do
  describe 'initialize' do
    it 'initializes with a hash' do
      new_app = Appointment.new({:doctor_id=>1,:patient_id=>3,:date=>'2014-08-06 00:00:00',:cost=>1000})
      expect(new_app).to be_an_instance_of Appointment
    end
  end

  describe 'self.all' do
    it 'returns an empty array' do
      expect(Appointment.all).to eq []
    end
  end

  describe 'save' do
    it 'saves an appointment' do
      new_app = Appointment.new({:doctor_id=>1,:patient_id=>3,:date=>'2014-08-06 00:00:00',:cost=>1000})
      new_app.save
      expect(Appointment.all[0]).to eq new_app
    end
  end

end

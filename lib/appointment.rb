class Appointment

  attr_reader :doctor_id, :patient_id, :date, :cost, :id

  def initialize attributes
    @doctor_id = attributes[:doctor_id]
    @patient_id = attributes[:patient_id]
    @date = attributes[:date]
    @cost = attributes[:cost]
    @id = attributes[:id]
  end

  def self.all
    appointments = []
    results = DB.exec("SELECT * FROM appointments")
    results.each do |result|
      attributes = {
        :id => result['id'],
        :doctor_id => result['doctor_id'],
        :patient_id => result['patient_id'],
        :date => result['date'],
        :cost => result['cost']
      }
      appointments << Appointment.new(attributes)
    end
    appointments
  end
end

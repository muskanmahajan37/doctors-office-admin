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
        :id => result['id'].to_i,
        :doctor_id => result['doctor_id'].to_i,
        :patient_id => result['patient_id'].to_i,
        :date => result['date'],
        :cost => result['cost'].to_i
      }
      appointments << Appointment.new(attributes)
    end
    appointments
  end

  def save
    results = DB.exec("INSERT INTO appointments (doctor_id, patient_id, date, cost) VALUES (#{doctor_id}, #{patient_id}, '#{date}', #{cost}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def == arg
    self.doctor_id == arg.doctor_id &&
    self.id == arg.id &&
    self.patient_id == arg.patient_id &&
    self.date == arg.date &&
    self.cost == arg.cost
  end
end

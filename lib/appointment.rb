class Appointment

  attr_reader :doctor_id, :pateint_id, :date, :cost, :id

  def initialize attributes
    @doctor_id = attributes[:doctor_id]
    @patient_id = attributes[:patient_id]
    @date = attributes[:date]
    @cost = attributes[:cost]
    @id = attributes[:id]
  end
end

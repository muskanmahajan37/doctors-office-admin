require 'pg'

class Patient

  attr_reader :name, :birthdate

  def initialize attributes
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
    @id = attributes[:id]
    @doctor_id = attributes[:doctor_id]
  end

  def self.all
    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :birthdate => result['birthdate'],
        :id => result['id'],
        :doctor_id => result['doctor_id']
      }
      patients << Patient.new(attributes)
    end
    patients
  end
end

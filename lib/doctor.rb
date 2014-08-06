require 'pg'

class Doctor

  attr_reader :name, :specialty, :id

  def initialize attributes
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'],
        :id => result['id'].to_i
      }
      doctors << Doctor.new(attributes)
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{name}', '#{specialty}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def == another_doctor
    self.name == another_doctor.name && self.id == another_doctor.id
  end
end

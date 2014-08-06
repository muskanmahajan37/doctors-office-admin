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
      name = result['name']
      specialty = result['specialty']
      id = result['id'].to_i
      doctors << Doctor.new(name, specialty, id)
    end
    doctors
  end
end

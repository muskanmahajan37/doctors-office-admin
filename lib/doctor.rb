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
        :specialty => result['specialty'].to_i,
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

  def edit_specialty number
    DB.exec("UPDATE doctors SET specialty = #{number} WHERE id = #{id};")
    @specialty = number.to_i
  end

  def == another_doctor
    self.name == another_doctor.name && self.id == another_doctor.id
  end

  def self.list_by_specialty number
    # doctors = []
    # results = DB.exec(SELECT * docs WHERE speciality = #{number})
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE specialty = #{number};")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :id => result['id'].to_i
      }
      doctors << Doctor.new(attributes)
    end
    doctors
  end
end

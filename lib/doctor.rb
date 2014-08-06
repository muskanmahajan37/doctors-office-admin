require 'pg'

class Doctor

  attr_reader :name, :specialty, :id, :insurance

  def initialize attributes
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
    @insurance = attributes[:insurance]
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :insurance => result['insurance'].to_i,
        :id => result['id'].to_i
      }
      doctors << Doctor.new(attributes)
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def edit_specialty number
    DB.exec("UPDATE doctors SET specialty = #{number} WHERE id = #{id};")
    @specialty = number.to_i
  end

  def edit_insurance number
    DB.exec("UPDATE doctors SET insurance = #{number} WHERE id = #{id};")
    @insurance = number.to_i
  end

  def == another_doctor
    self.name == another_doctor.name && self.id == another_doctor.id
  end

  def self.list_by_specialty number
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

  def self.list_by_insurance number
    doctors = []
    results = DB.exec("SELECT * FROM doctors WHERE insurance = #{number};")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :insurance => result['insurance'].to_i,
        :id => result['id'].to_i
      }
      doctors << Doctor.new(attributes)
    end
    doctors
  end
end

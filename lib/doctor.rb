class Doctor

  attr_reader :name, :specialty, :id, :insurance, :patient_count

  def initialize attributes
    @name = attributes[:name]
    @specialty = attributes[:specialty]
    @id = attributes[:id]
    @insurance = attributes[:insurance]
    @patient_count = attributes[:patient_count]
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :insurance => result['insurance'].to_i,
        :patient_count => result['patient_count'].to_i,
        :id => result['id'].to_i
      }
      doctors << Doctor.new(attributes)
    end
    doctors
  end

  def self.find_by_id num
    doctor = []
    results = DB.exec("SELECT * FROM doctors WHERE id = #{num}")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :insurance => result['insurance'].to_i,
        :patient_count => result['patient_count'].to_i,
        :id => result['id'].to_i
      }
      doctor << Doctor.new(attributes)
    end
    doctor
  end

  def patient_count
    count = 0
    Patient.all.each do |patient|
      if patient.doctor_id == @id
        count += 1
      end
    end
    count = count.to_i
    DB.exec("UPDATE doctors SET patient_count = #{count} WHERE id = #{id};")
    @patient_count = count.to_i
  end

  def self.all_number_of_patients
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :specialty => result['specialty'].to_i,
        :insurance => result['insurance'].to_i,
        :id => result['id'].to_i,
        :patient_count => result['patient_count'].to_i,
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

  def find_specialty
    spec = DB.exec("SELECT * FROM specialties WHERE id = #{specialty}")
    spec.to_s
  end

  def edit_insurance number
    DB.exec("UPDATE doctors SET insurance = #{number} WHERE id = #{id};")
    @insurance = number.to_i
  end

  def find_insurance
    insur = DB.exec("SELECT * FROM insurance WHERE id = #{insurance}")
    insur.to_s
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

  def remove
    DB.exec("DELETE FROM doctors WHERE id = #{id}")
  end

end

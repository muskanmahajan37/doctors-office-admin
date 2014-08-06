class Specialty
  attr_reader :name, :id

  def initialize attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    specialties = []
    results = DB.exec("SELECT * FROM specialties;")
    results.each do |result|
      attributes = {
        :name => result['name'],
        :id => result['id'].to_i
      }
      specialties << Specialty.new(attributes)
    end
    specialties
  end

  def save
    results = DB.exec("INSERT INTO specialties (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def remove
    DB.exec("DELETE FROM specialties WHERE id = #{id}")
  end

  def == another_specialty
    self.name == another_specialty.name && self.id == another_specialty.id
  end
end

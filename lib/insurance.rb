require 'pg'

class Insurance
  attr_reader :company, :id

  def initialize attributes
    @company = attributes[:company]
    @id = attributes[:id]
  end

  def self.all
    insurance = []
    results = DB.exec("SELECT * FROM insurance;")
    results.each do |result|
      attributes = {
        :company => result['company'],
        :id => result['id'].to_i
      }
      insurance << Insurance.new(attributes)
    end
    insurance
  end
end

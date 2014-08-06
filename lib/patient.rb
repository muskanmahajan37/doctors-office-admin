require 'pg'

class Patient

  attr_reader :name, :birthdate

  def initialize attributes
    @name = attributes[:name]
    @birthdate = attributes[:birthdate]
  end
end

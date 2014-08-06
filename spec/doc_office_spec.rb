require 'rspec'
require 'pg'
require 'doctor'
require 'patient'
require 'specialty'
require 'insurance'
require 'appointment'

DB = PG.connect({:dbname => 'doc_office_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM insurance *;")
    DB.exec("DELETE FROM specialties *;")
    DB.exec("DELETE FROM appointments *;")
  end
end

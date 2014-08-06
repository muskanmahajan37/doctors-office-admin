require 'rspec'
require 'doctor'
require 'patient'
require 'specialty'
require 'insurance'

DB = PG.connect({:dbname => 'doc_office_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM insurance *;")
    DB.exec("DELETE FROM specialties *;")
  end
end

require 'rspec'
require 'doctor'
require 'patient'

DB = PG.connect({:dbname => 'doc_office_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
  end
end

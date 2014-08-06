require 'pg'
require './lib/doctor'
require './lib/patient'
require './lib/specialty'
require './lib/insurance'
require './lib/appointment'

DB = PG.connect({:dbname => 'doc_office_prod'})

def header
  system 'clear'
  puts "Health Offices of Graggen, Doom & Slopper"
end

def ws
  puts "\n"
end

def ln
  ws
  puts "******"
  ws
end

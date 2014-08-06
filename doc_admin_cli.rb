require './helper.rb'

def main_menu
  header
  ws
  puts "1 > New Doctor"
  puts "2 > New Patient"
  puts "3 > New Medical Specialty"
  puts "4 > New Insurance Company"
  puts "L > Show Doctors"
  puts "P > Show Patients"
  puts "S > Show Medical Specialties"
  puts "I > Show Insurance Companies"
  puts "X > Exit"
  ws
end

main_menu

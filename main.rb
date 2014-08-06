require './helper.rb'

def main_menu
  header
  ws
  puts "1 > New Doctor"
  puts "2 > New Patient"
  puts "3 > New Medical Specialty"
  puts "4 > New Insurance Company"
  puts "5 > Make Appointment"
  ws
  puts "D > Show Doctors"
  puts "P > Show Patients"
  puts "S > Show Medical Specialties"
  puts "I > Show Insurance Companies"
  puts "A > Show Appointments"
  ws
  puts "X > Exit"
  ws

  case gets.chomp.upcase
  when '1'
    add_doctor
  when '2'
    add_patient
  when '3'
    add_specialty
  when '4'
    add_insurance
  when '5'
    add_appointment
  when 'D'
    list_doctors
  when 'P'
    list_patients
  when 'S'
    list_specialties
  when 'I'
    list_insurance
  when 'A'
    list_appointments
  when 'X'
    exit
  end
end

def add_insurance
  header
  ws
  puts "Enter the name of the new Insurance Company:"
  new_insurance = Insurance.new(:company=>gets.chomp)
  new_insurance.save
  puts new_insurance.company + " added."
  sleep 0.7
  main_menu
end

def add_doctor
  header
  ws
  puts "Enter the name of the new Doctor:"
  new_doctor = Doctor.new(:name=>gets.chomp)
  new_doctor.save
  puts new_doctor.name + " added."
  sleep 0.7
  main_menu
end

def add_patient
  header
  ws
  puts "Enter the name of the new Patient:"
  new_patient = Patient.new(:name=>gets.chomp)
  new_patient.save
  puts new_patient.name + " added."
  sleep 0.7
  main_menu
end

def list_insurance
  header
  ws
  Insurance.all.each do |insurer|
    puts "Insurance Company: " + insurer.company
    ln
  end
end


def list_doctors
  header
  ws
  Doctor.all_number_of_patients.each do |doctor|
    puts "Name: " + doctor.name
    puts "DocID: " + doctor.id.to_s
    spec = doctor.find_specialty
    puts "Specialty: " + spec
    doctor.patient_count
    insur = doctor.find_insurance
    puts "Accepts: " + insur
    puts "Number of Patients: " + doctor.patient_count.to_s
    ln
  end
  ws
  puts "Enter Doctor ID to edit existing Doctor:"
  id_query = gets.chomp.to_i
  view_doctor(id_query)
end

def view_doctor id_query
  num = id_query
  header
  ws
  doctor = Doctor.find_by_id(num)
  puts "Name: " + doctor.name
  puts "DocID: " + doctor.id.to_s
  spec = doctor.find_specialty
  puts "Specialty: " + spec
  doctor.patient_count
  insur = doctor.find_insurance
  puts "Accepts: " + insur
  puts "Number of Patients: " + doctor.patient_count.to_s
  ln
end

def list_patients
  header
  ws
  Patient.all.each do |patient|
    puts "Name: " + patient.name
    puts "PatientID: " + patient.id.to_s
    puts patient.birthdate.to_s
    ln
  end
end

main_menu

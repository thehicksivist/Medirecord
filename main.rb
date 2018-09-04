require_relative "../medirecord/user/patient"
require_relative "../medirecord/library/functions"
include Lib

#patient = Patient.new
# puts patient

#1 display emergency message
puts "If this is an emergency, please call 000."

#2 create 2 files programmatically
doctor_filename = "data/doctor.json"
patient_filename = "data/patient.json"

Lib::file_exists?(doctor_filename)
Lib::file_exists?(patient_filename)

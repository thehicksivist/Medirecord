require_relative "../medirecord/user/patient"

#patient = Patient.new
# puts patient

#1 display emergency message
puts "If this is an emergency, please call 000."

#2 create 2 files programmatically
doctor_filename = "data/doctor.json"
patient_filename = "data/patient.json"

#3 check if exists, create if not
if doctor_filename.exist? 
break
else
    File.open(doctor_filename, 'w+')
end
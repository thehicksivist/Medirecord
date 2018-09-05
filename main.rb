# 1. Establish the Application Path
APP_ROOT = File.dirname(__FILE__)             

# 2. Look for file globally 
$:.unshift(File.join(APP_ROOT,'user'))

# 3. Include the guide file 
require 'json'
require 'app_guide'

# 4. Path names
doctor_file_path = "data/doctor.json"
patient_file_path = "data/patient.json"

# 5. Create new App Guide 
app_guide = AppGuide.new(doctor_file_path, patient_file_path)

# 6. Run the App
app_guide.run_medirecord!








# data = "Very, very confidential data"
# puts SecureData.encrypt(data)
# puts SecureData.decrypt(SecureData.encrypt(data))

# Doctor login
# Patience visits
# What is your surname? gets.chomp



patients = [
    {patient: [{username:"John",password:"123John",dob:"21/02/1990",age:"25",date:"19/02/2018",illness:"Flue",treatment: "Panadol Rapid" }]}, 
    {patient: [{username:"Sara",password:"123Sara",dob:"01/02/1995",age:"28",date:"19/06/2018",illness:"",treatment: "" }]},
    {patient: [{username:"Does",password:"123Does",dob:"20/05/1988",age:"30",date:"19/02/2018",illness:"",treatment: "" }]}
    ]
doctors  = 
[   {doctor: "christopher",password: "111christ", age: "45", specialty: "GP"}, 
    {doctor: "randolphoe", password: "111rando" , age: "55", specialty: "Surgeon"}
]

# secur_data = SecureData.new

# patients.each do |patient, val|
#     patient[:password] = SecureData.encrypt(patient[:password])

#     patient[:dob] = SecureData.encrypt(patient[:dob])
#     patient[:age] = SecureData.encrypt(patient[:age])

#     patient[:date] = SecureData.encrypt(patient[:date])

#     patient[:illness] = SecureData.encrypt(patient[:illness]) if patient[:illness] != ""
#     patient[:treatment] = SecureData.encrypt(patient[:treatment]) if patient[:treatment] != ""
#     #puts SecureData.decrypt(encrypt)
# end

# doctors.each do |doctor, val|
#     doctor[:password] = SecureData.encrypt(doctor[:password])
#     doctor[:age]      = SecureData.encrypt(doctor[:age])
#     doctor[:specialty] = SecureData.encrypt(doctor[:specialty])
# end


# puts "-" * 60
# #p patients.inspect 
# p data = Marshal.dump(patients)
# puts "..............."
# p obj  = Marshal.load(data)
# puts "..............."

# puts 
# puts "-" * 60
# p doctors.inspect 

# puts data = Marshal.dump(patients)
#obj = Marshal.load(data)

# # convert items to json format and write to file
#File.write(patient_file_path, Marshal.dump(patients))

# File.write(doctor_file_path, Marshal.dump(doctors))

# File.write(doctor_file_path, JSON.dump(doctors))





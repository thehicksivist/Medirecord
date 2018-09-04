require_relative "../medirecord/user/patient"
require_relative "../medirecord/library/lib"
include Lib

#patient = Patient.new
# puts patient

#1 display emergency message
system "cls"                            # for gitbash use > system "clear"
puts "#{''.center(10)}Please call 000 If this is an emergency.".upcase
puts

#2 create 2 files programmatically
doctor_filename = "data/doctor.json"
patient_filename = "data/patient.json"

Lib::file_exists?(doctor_filename)
Lib::file_exists?(patient_filename)

puts "#{''.ljust(10)}Please select Login Type \n1)Doctor \n2)Patient"

input = gets.chomp.to_i

    until input == 1 || input == 2
        system "cls"
        puts "#{''.ljust(10)}Please select Login Type \n1)Doctor \n2)Patient"
        input = gets.chomp.to_i
    end

    if input == 1
        #ask to enter doctor name and password
    elsif input == 2
        #ask to enter patient name and password
    else
        puts "Incorrect selction: please select option 1 0r 2"

end
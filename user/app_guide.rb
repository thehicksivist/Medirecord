
# # Include the neccessary file
# require 'xxxx'
 require '../library/lib'

# Create a guide class
class AppGuide

    # Create class constructor to initialize the Object
  def initialize(path = nil)
    # Locate file paths for doctor or patient json files
    # Lib::file_exists?(doctor_filename)
    # Lib::file_exists?(patient_filename)
    
    # Check if file exist, writable, readable
    # Create file if it doesn't exist
    # Return file found if exist
    # Hard exit         
  end

  def run_medirecord!
    # Display Introduction
    # OPTION LOOP
    #   Get user Actions or Options
    #   Perform User Actions and return results
    # If result is :quit, Display conclusion Message and close App.
  end

  def get_option
    option = nil
    until ['1','2','quit'].include?(option)
      print 'Select: '
      get_input = gets.chomp 

      # Downcase the input and remove whitespaces
      option    = get_input.downcase.strip                   
    end

    return option
  end

  def run_option_task(task)
    # when task is 1 to login as doctor
    # when task is 2 to login as patient
    # when task is 3 to login as HR (OPTIONAL)
    # when task is quit to close the app
    # Otherwise display "Invalid command"
    # End case task
  end

  # This method display company logo and emergency information
  def display_intro
    # Display Company Logo
    # Display Emergency Information
  end

  # This method create and display conclusion Message
  def display_exiting!(text)
    # create goodbye message
    # display welformatted conclusion message
    puts "\n#{text.upcase.center(60)}\n\n"
  end

end




# require_relative "../medirecord/user/patient"
# require_relative "../medirecord/library/lib"
# include Lib
#patient = Patient.new

# #patient = Patient.new
# # puts patient

# #1 display emergency message
# system "cls"                            # for gitbash use > system "clear"
# puts "#{''.center(10)}Please call 000 If this is an emergency.".upcase
# puts

# #2 create 2 files programmatically
# doctor_filename = "data/doctor.json"
# patient_filename = "data/patient.json"

# Lib::file_exists?(doctor_filename)
# Lib::file_exists?(patient_filename)

# puts "#{''.ljust(10)}Please select Login Type \n1)Doctor \n2)Patient"

# input = gets.chomp.to_i

#     until input == 1 || input == 2
#         system "cls"
#         puts "#{''.ljust(10)}Please select Login Type \n1)Doctor \n2)Patient"
#         input = gets.chomp.to_i
#     end

#     if input == 1
#         #ask to enter doctor name and password
#     elsif input == 2
#         #ask to enter patient name and password
#     else
#         puts "Incorrect selction: please select option 1 0r 2"

# end
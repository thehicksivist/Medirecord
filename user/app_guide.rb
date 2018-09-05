
# # Include the neccessary file
# require 'xxxx'
require 'doctor'

$:.unshift(File.join(APP_ROOT,'utilities'))
require 'encryption'

# Create a guide class
class AppGuide
     @@doctor_file_path  = nil 
     @@patient_file_path = nil
     @@data = []

     # CLASS METHODS ..............................................................
  # def file_paths=(doctor_path = nil, patient_path = nil)
  #   @@doctor_file_path  = File.join(APP_ROOT,doctor_path)
  #   @@patient_file_path = File.join(APP_ROOT,patient_path)
  #   return [@@doctor_file_path, @@patient_file_path]
  # end
  
    # Create class constructor to initialize the Object
  def initialize(doctor_path = nil, patient_path = nil)
    @@doctor_file_path  = doctor_path
    @@patient_file_path = patient_path
    # Locate file paths for doctor or patient json files
    file_exists?(doctor_path)
    file_exists?(patient_path)
    # Check if file exist, writable, readable
    # Create file if it doesn't exist
    # Return file found if exist
    # Hard exit         
  end

  def run_medirecord!
    # Display Introduction
    display_intro
    
    result = nil
    # OPTION LOOP
    until result == :quit
      # Get user Actions or Options
      task = get_option

      # Perform User Actions and return results
      result = run_option_task(task)
    end

    # If result is :quit, Display conclusion Message and close App.
    display_exiting!("Thanks for using MediRecord. Goodbye!")
  end

  def get_option
    # Display options for user input
    system "clear"
    display_intro
    display_options(20)

    option = nil
    until ['1','2','q', 'quit'].include?(option)
      puts "I don't understand that."
      print "#{' '.ljust(20)}> Select: "
      get_input = gets.chomp 

      # Downcase the input and remove whitespaces
      option    = get_input.downcase.strip                   
    end

    return option
  end

  def run_option_task(task)
    case task
    # when task is 1 to login as doctor
    when "1"
      # run doctor task
      # Read in file
      @@data = load_records(@@doctor_file_path)
      user_name = Doctor.get_doctor_name
      user_password = Doctor.get_password
      results = verify_password!(user_name, user_password)
      if results == true
        puts "Welcomed, Dr. #{user_name}"
        puts "Please Enter a patient's name: "
        @@data = load_records(@@patient_file_path)

        patient_name = gets.chomp.strip 
        patient = load_patient_record(patient_name)
        puts "-" * 62
      end

      #p @data 
      #puts "Doctor Login ..." if verify_password!("password")
      return task 
    # when task is 2 to login as patient
    when "2"
      # run Patient task
      puts "Patient Login ..."
      return task
    # when task is 3 to login as HR (OPTIONAL)

    # when task is quit to close the app
    when "quit"
      return :quit
    when "q"
      return :quit
    else 
      puts "\nInvalid command entered."
    # Otherwise display "Invalid command"
    # End case task
    end
  end

  def load_patient_record(patient_name)
    display_intro
    puts "-" * 62
    puts "Name\tAge\tDOB\t\tllness\t\tMedication"
    puts "-" * 62
    @@data.each do |cat|
      if cat[:patient].downcase == patient_name.downcase
        puts "#{cat[:patient]}\t#{cat[:age]}\t#{cat[:dob]}\t#{cat[:illness]}\t\t#{cat[:treatment]}"  
        return true      
      end
    end
    return false 
  end

  def verify_password!(username, password)
    @@data.each do |user|
      p user
      if user[:doctor].downcase == username.downcase &&  user[:password] == password         
         #puts SecureData.decrypt(user[:password],SecureData.key, SecureData.iv )
         return true
      end
    end
    return false 
  end

  # read file
  def load_records(file_path)
    if file_usable?(file_path)
      data = File.read(file_path)
      #data_object = Marshal.load(data)
      data_object = JSON.parse(data, :symbolize_names => true)
      return data_object
    end
    return nil 
  end

  def file_usable?(file_path)
    return false unless File.exists?(file_path)
    return false unless File.readable?(file_path)
    return false unless File.writable?(file_path)
    return true
  end

  # This method display company logo and emergency information
  def display_intro
    # Display Company Logo
    display_logo
    # Display Emergency Information
    display_emergency_info
  end

  # This method create and display conclusion Message
  def display_exiting!(text)
    # create goodbye message
    # display welformatted conclusion message
    puts "\n#{text.upcase.center(60)}\n\n"
  end

  def file_exists?(file_name)
    if File.exist?(file_name) 
        # TEST puts "File exists"
    else
        File.open(file_name, 'w+')
        # TEST puts "File created"
    end
  end

  def display_logo
    print " " * 41 
    puts  "-"
    puts  " " * 39 + "-" + " " * 2 + "-"
    puts  " " * 36 + "MediRecord"
  end

  def display_emergency_info
    puts "#{" ".center(20)}Please call 000 if you need an emergency.".upcase
  end
  def display_options(position)
    print " ".ljust(position)
    puts "Please select an options:"
    print " ".ljust(position)
    puts "1 to login as a doctor"
    print " ".ljust(position)
    puts "2 to login as a patient"
    print " ".ljust(position)
    puts "q to close the App"
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
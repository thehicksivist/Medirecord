
# # Include the neccessary file
# require 'xxxx'
require 'date'
require 'doctor'
require 'patient'
require 'color'
require_relative '../library/lib'

$:.unshift(File.join(APP_ROOT,'utilities'))
require 'encryption'

# Create a guide class
class AppGuide
     include Lib

     LAST_THIRTY_DAYS = 30

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
      puts "I don't understand that." if option
      print "#{' '.ljust(20)}>  Select: "
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
      @@data        = load_records(@@doctor_file_path)
      user_name     = Doctor.get_doctor_name
      user_password = Doctor.get_password

      logged_in     = verify_password!(user_name, user_password)
      
      if logged_in 
        system "clear"
        display_logo
        prompt_user(nil, "Welcomed, Dr. #{user_name}\n", 25)
        prompt_user(nil, "Please Enter a patient's name: ", 25)
        #puts "Welcomed, Dr. #{user_name}"
        #print "Please Enter a patient's name: "
        #output_records_table(@@data)

        @@data = load_records(@@patient_file_path)

        patient_name = gets.chomp.strip 
        
        #patient = load_patient_record(patient_name)
        patient = view_all_patient_records(patient_name)
        puts "-" * 77
        print "What would like to do, Dr. #{user_name}? Options(update, quit) > "
        puts task = gets.chomp.strip.downcase 
      end

      #p @data 
      #puts "Doctor Login ..." if verify_password!("password")
      return task 
    # when task is 2 to login as patient
    when "2"
      # run Patient task
      @@data        = load_records(@@patient_file_path) 
      user_name     = Patient.get_patient_name
      user_password = Patient.get_password
      authenticated = authenticate_patient(user_name, user_password)
      if authenticated
        system "clear"
        display_intro
        prompt_user(nil, "Welcomed, #{user_name.capitalize}\n", 19)
        prompt_user(nil, "What records would you like to view? Options(all, current, quit)\n", 19)
        prompt_user(nil, ":> ", 19)

        task = gets.chomp.downcase.strip 
        if task == "all"
          patient = view_all_patient_records(user_name)
          puts "-" * 77
          prompt_user(nil, "press any key to... ", 19)
          gets 
        elsif task == "current"
          view_current_records(user_name)
          puts "-" * 77
          prompt_user(nil, "press any key to... ", 19)
          gets 
          return task 
        elsif task == "quit"
          display_exiting!("Thanks for using MediRecord. Goodbye!")
          exit!
        else
          prompt_user(nil, "I don't understand that command, #{user_name.capitalize}\n", 19)
        end
        
      end
      
      return task

    # when task is 3 to login as HR (OPTIONAL)

    # when task is quit to close the app
    when 'quit','q'.downcase 
      return :quit
    else 
      puts "\nInvalid command entered."
    # Otherwise display "Invalid command"
    # End case task
    end
  end

  def load_patient_record(patient_name)
    display_logo
    puts "-" * 62
    puts "Name\tAge\tDOB\t\tIllness\t\tMedication"
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
      #p user
      if user[:doctor].downcase == username.downcase &&  user[:password] == password         
         #puts SecureData.decrypt(user[:password],SecureData.key, SecureData.iv )
         return true
      end
    end
    return false 
  end
  def view_all_patient_records(patient_name)
    display_intro
    puts 
    puts "Name\tDOB\t\tAge\tLast Visit\tTreated For\tMedication"
    puts "-" * 77
    @@data.each do |patient|
      patient.each do |key, value|
        #puts 
        if value[0][:username].downcase == patient_name.downcase
          value.each_with_index do |k, v|
            puts "#{k[:username]} #{k[:dob]}\t\t#{k[:age]}\t#{k[:date]}\t#{k[:illness]}\t\t#{k[:treatment]} "
          end
          return true
        end
      end
    end
    return false
  end
  
  def view_current_records(user_name)
    display_intro
    puts "#{user_name.capitalize}, here is a summary of your visits to doctors in the last 30 Days"
    puts 
    puts "Name\tDOB\t\tAge\tLast Visit\tTreated For\tMedication"
    puts "-" * 77
    # PATIENT VIEW: MOST RECENT HISTORICAL RECORDS
    @@data.each do |patient|
      patient.each do |key, v|    
        if v[0][:username].downcase == user_name.downcase
          num = v.length - 1 
          date_last_visit = Date.parse(v[num][:date])
          today = Date.parse(Time.now.strftime("%Y-%m-%d"))
          period = (today - date_last_visit).to_i 
          if period <= LAST_THIRTY_DAYS
            #puts "#{k[:username]} #{k[:dob]}\t\t#{k[:age]}\t#{k[:date]}\t#{k[:illness]}\t\t#{k[:treatment]} "

             puts "#{v[num][:username]} #{v[num][:dob]}\t\t#{v[num][:age]}\t#{v[num][:date]}\t#{v[num][:illness]}\t\t#{v[num][:treatment]} "
          end
          puts
        end
      end
    end
  end
  def authenticate_patient(user_name, user_password)
    @@data.each do |patient|
      patient.each do |key, value|
        #puts 
        if value[0][:username].downcase == user_name.downcase && value[0][:password] == user_password
          return true
        end
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

  def prompt_user(user, message, value)
    print "#{' '.ljust(value + 1)}" if user
    puts user.upcase if user
    print "#{' '.ljust(value)} #{message}"
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
    system "clear"
    msg = colorize(" #{text.upcase} ", $font_colors[:cyan])
    puts "\n#{msg.center(77)}\n\n"
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
    system "clear"
    print " " * 41 
    puts  "-"
    puts  " " * 39 + "-" + " " * 2 + "-"
    puts  " " * 36 + colorize(" MediRecord ", $font_colors[:white], $bg_colors[:green])
    puts ""
  end

  def display_emergency_info
    msg = colorize(" #{'Please call 000 if you need an emergency'.upcase} ", 
                    $font_colors[:yellow], $bg_colors[:red])
    puts "#{" ".center(20)}#{msg}"
  end
  def display_options(position)
    print " ".ljust(position)
    puts "What would you like to do? Select: "
    print " ".ljust(position)
    puts "1  to login as a doctor"
    print " ".ljust(position)
    puts "2  to login as a patient"
    print " ".ljust(position - 1)
    puts "'q' to close the App"
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

# def output_records_table(records =[])
#   print " " + "No.".ljust(9)
#   print " " + "Name".ljust(15)
#   print " " + "Age".ljust(10)
#   print " " + "DOB".ljust(10)
#   print " " + "Illness".ljust(15)
#   print " " + "Medication".rjust(5) + "\n"
#   puts  "-" * 71
#   #currency_offset = 0
#   records.each do | record, index |
#     next unless   !record[:name].to_s.empty? && 
#                   !record[:age].to_s.empty? && 
#                   !record[:dob].to_s.empty? && 
#                   !record[:illness].to_s.empty? && 
#                   !record[:treatment].to_s.empty? && 
#     line_offset       = index < 10 ? 8 : 7
#     currency_offset   = rest.price.to_f < 10.0 ? 6 : 5

#     line =  " "   + index.to_s + ".".ljust(line_offset)
#     line << " "   + record[:name].titleize.ljust(30)
#     line << " "   + record[:age].titleize.ljust(20)
#     line << " "   + record[:dob].titleize.ljust(20)
#     line << " "   + record[:illness].titleize.ljust(20)
#     line << " "   + record[:treatment].titleize.ljust(20)
#     puts line
#   end
#   puts "No listings found" if records.empty?
#   puts "-" * 71
# end
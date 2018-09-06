require 'app_guide'
require_relative '../library/lib'

#create class
class Doctor
    include Lib
    def create_doctor
        #create new hash 
        #encrypt name and password
        #open the doctor file, save encrypted data
    end
    def self.get_doctor_name
        #read from list of doctors to check if doctor exists
        #File.open()
        #decrypt name and password
        #compare entered details, accept if correct
        user_user = nil
        puts 
        prompt_user("Doctor Login ", "User Name: ", 19)
        user_input = gets.chomp 
        user_name  = user_input.strip 
    end
    def self.get_password
        user_password = nil
        prompt_user(nil, "Password:  ", 19)
        user_input    = gets.chomp 
        user_password = user_input.strip 
    end
    def self.prompt_user(user, message, value)
        print "#{' '.ljust(value + 1)}" if user
        puts user.upcase if user
        print "#{' '.ljust(value)} #{message}"
    end

    def load_doctor_records(file_path)
        
    end

    def doctor_exists?(name, password)
        #return true if name and pasword matches
    end
    #if doctor exists, login > select record (list patients by name)
    
end
#create methods
#methods; view all patients, create patient, edit existing patients
require 'app_guide'
#create class
class Doctor
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
        puts "You are logging in as a Doctor - Please Enter User Name: "
        user_input = gets.chomp 
        user_name  = user_input.strip 
    end
    def self.get_password
        user_password = nil
        puts "Please Enter Password: "
        user_input    = gets.chomp 
        user_password = user_input.strip 
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
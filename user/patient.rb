#creating a patient class that holds the details of a patient for the medical records
class Patient
    
    def save_patient_record
        patients = []
        @patients << {patient:{
            name: "", password: "", dob: "", age: 0, height: 0, weight: 0, ailment: "", treatment: "", 
            time: Time.now
        }}

        return patients
    end

    def load_patients_records(path)
        
    end
    def self.get_patient_name
        #read from list of doctors to check if doctor exists
        #File.open()
        #decrypt name and password
        #compare entered details, accept if correct
        user_user = nil
        puts 
        prompt_user("Patient Login ", "User Name: ", 19)
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
    #view current record
    #historical records 
    #(go back and forward records)
end
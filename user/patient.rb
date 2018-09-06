#creating a patient class that holds the details of a patient for the medical records
class Patient
    def self.get_patient_condition
        patient = {}
        # Get the patient's diagnosis and prescription
        query   = query_diagnosis_prescription
        patient = {username: "", password: "", dob: "", age: "", 
                   date: Time.now.strftime("%Y/%m/%d") , 
                   illness: query[0], 
                   treatment: query[1]
                 }

        return patient
    end

    def self.query_diagnosis_prescription
        query = []
        print "What are you are you treating the patient for today? > "
        user_input = gets.chomp.strip
        query << user_input
        print "What medication are you prescribing? > "
        user_input = gets.chomp.strip
        query << user_input
        return query
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
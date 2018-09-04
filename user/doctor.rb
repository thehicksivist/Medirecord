#create class
Class Doctor
    attr_accessor :name, :password
    def create_doctor
        #create new hash 
        #encrypt name and password
        #open the doctor file, save encrypted data
    end
    def read_doctor_list
        #read from list of doctors to check if doctor exists
        #File.open()
        #decrypt name and password
        #compare entered details, accept if correct
    end
    def doctor_exists?(name, password)
        #return true if name and pasword matches
    end
    #if doctor exists, login > select record (list patients by name)
end
#create methods
#methods; view all patients, create patient, edit existing patients
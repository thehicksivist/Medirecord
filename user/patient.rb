#creating a patient class that holds the details of a patient for the medical records
class Patient
    @patients = []
    
    def initialize
        @patients << {patient:{
            name: password: dob: age: height: weight: ailment: treatment: time: Time.now
        }}
    end
end
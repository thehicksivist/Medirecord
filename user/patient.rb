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
    #view current record
    #historical records 
    #(go back and forward records)
end
require 'test/unit'
require_relative '../user/patient'

class FileExistTest < Test::Unit::TestCase
    def test_username_exist?
        patient = Patient.get_patient_condition
        assert_equal("john", patient[:username])
    end
    def test_password_exist?
        patient = Patient.get_patient_condition
        assert_equal("123John", patient[:password])
    end
    def test_dob_exist?
        patient = Patient.get_patient_condition
        assert_equal("12/02/2000", patient[:dob])
    end
    def test_age_exist?
        patient = Patient.get_patient_condition
        assert_equal("18", patient[:age])
    end
    def test_illness_exist?
        patient = Patient.get_patient_condition
        assert_equal("malaria", patient[:illness])
    end
    def test_treatment_exist?
        patient = Patient.get_patient_condition
        assert_equal("chloro", patient[:treatment])
    end
end
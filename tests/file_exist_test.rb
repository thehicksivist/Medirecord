require 'test/unit'
require_relative '../main'

class FileExistTest < Test::Unit::TestCase
    def test_exist?
        assert_equal("doctor.json", doctor_filename)
    end
end
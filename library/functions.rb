# check if file exists, create if not
module Lib
    def file_exists?(file_name)
        if File.exist?(file_name) 
            puts "File exists"
        else
            File.open(file_name, 'w+')
            puts "File created"
        end
    end
end

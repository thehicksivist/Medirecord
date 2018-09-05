# check if file exists, create if not
module Lib
    def prompt_user(user, message, value)
        print "#{' '.ljust(value + 1)}" if user
        puts user.upcase if user
        print "#{' '.ljust(value)} #{message}"
    end

end

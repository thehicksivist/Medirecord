#user class for reference on login
Class User    
    #creates a user with an array listing type (to check if doctor or patient), name and password
    @@user = []
    def user  
        @@user << {user:{type: "", name: "", password: "",
        }}
        return user
    end
end
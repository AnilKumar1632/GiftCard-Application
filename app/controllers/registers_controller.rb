class RegistersController < ApplicationController
    def index
        flash[:alert] = ""
        render "index"
    end

    def welcome
        render "welcome"
    end

    def create
        email=params[:username]
        password=params[:password]
        username =params[:username1]
        user = Register.find_by(:email=>email)
        user1 = Register.find_by(:username=>username)
   
        if user    
            flash[:alert] = "Email already taken"
            render "index"
        elsif user1
            flash[:alert] = "Username already taken"
            render "index"
        elsif password!=params[:confirmpassword]   
            flash[:alert] = "Check for password"
            render "index"
        else
            Register.create(
                :email => email,
                :password_digest => password,
                :username => username
            )
            render "sessions/index"    
        end   
    end
end

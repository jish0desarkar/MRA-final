class UsersController < ApplicationController
    before_action do 
        redirect_to new_user_registration_path unless current_user != nil && current_user.admin == true
    end
    helper :application
    def index
        @users = User.all
    end




end
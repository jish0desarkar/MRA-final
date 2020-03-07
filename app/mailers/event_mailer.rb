class EventMailer < ApplicationMailer
    helper :application
    def new_meeting_email
        @meeting = params[:meeting]
        @users = params[:users]
        mail(to: @users.map{|user| user.email}, subject: "Invitation to Commutatus meeting")
    end
end

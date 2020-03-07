module ApplicationHelper
    def formatted_time(time)
        time.strftime("%I:%M%P")
    end
    def formatted_date(date)
        date.strftime("%d %b %Y")
    end
    def formatted_email(email)
        email.split('@')[0].capitalize
    end
end

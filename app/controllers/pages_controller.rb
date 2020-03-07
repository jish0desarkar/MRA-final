class PagesController < ApplicationController
  before_action do
    if(current_user != nil)
     redirect_to meetings_path
    end 
  end
  def home

  end
end

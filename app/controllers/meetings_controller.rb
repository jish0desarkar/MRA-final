class MeetingsController < ApplicationController
  helper :application
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :delete_user]
  before_action do 
    redirect_to new_user_session_path unless current_user
  end
  
  before_action :check_user, only: [:all_meetings]
  before_action :authenticate_user!
  before_action :authenticate_user!, except: [:show, :index]
  # GET /meetings
  # GET /meetings.json
  def index
      @meetings = current_user.meetings 
    
      @meeting_prev = current_user.meetings.where('date < ?' ,Date.today).order(:date)
      @meeting_next = current_user.meetings.where('date > ?' ,Date.today).order(:date)
      @meeting_curr = current_user.meetings.where('date = ?' ,Date.today).order(:date)
  end


  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

  end

  def all_meetings  
    @meetings = Meeting.all
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  def delete_user
    current_user.meetings.delete(@meeting)
    redirect_to meetings_path
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @rooms = Room.all
    @users = User.all
    @meeting = Meeting.new(meeting_params)
    @meeting.users << current_user
    
    respond_to do |format|
      if @meeting.save
        EventMailer.with(meeting: @meeting, users: @meeting.users.map {|u| u}).new_meeting_email.deliver_now
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    @meeting.users << current_user
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_user
    if current_user.admin == false
      redirect_to meetings_path, alert:"Access denied"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:name, :date, :s_time, :e_time, :room_id, :attending, user_ids: [])
    end
end

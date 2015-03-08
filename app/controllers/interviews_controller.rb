class InterviewsController < ApplicationController
  before_action :authenticate_user_from_token!
  
  
  def create
  #  setup_date = Interview.interview_date(params[:interview_time])
    @listing = set_listing
    @user = set_user
    @interview = @user.interviews.new(:listing_id => params[:lid],
                                      :position_title => @listing.job_title,
                                      :follow_up_email => params[:interviews][:follow_up_email],
  #                                    :interview_time => setup_date(params[:interviews][:interview_time]),
                                      :interviewtype => params[:interviews][:interviewtype],
                                      :notes => params[:interviews][:notes],
                                      :interviewed => params[:interviews][:interviewed],
                                      :status => params[:interviews][:status])
    if @interview.save
      render json: { :interview => @interview }, status: :ok
    else
      render json: { :error => "Not created" }, status: :bad_request
    end
  end

  def edit
    @interview = set_interview
    if @interview.update( interview_params )
      render json: { :interview => @interview }, status: :ok
    else
      render json: { :error => "There was a problem saving the interview" }, status: :bad_request
    end
  end

  def index
    @user = set_user
    @interviews = @user.interviews
    if @interviews.count > 0
      render json: { :interviews => @interviews }, status: :ok
    else
      render json: { :error => "There are currently no interviews" }, status: :no_content
    end
  end

  def show
    @interview = set_interview
    render json: { interview: @interview }, status: :ok
  end

  def destroy
    @interview = set_interview
    if @interview.destroy
      render json: { :message => "Interview deleted" }, status: :ok
    else
      render json: { :error => "There was a problem removing the interview" }, status: :no_content
    end
  end

  private
    def set_user
      @user = current_user
    end

    def set_listing
      @listing = Listing.find(params[:lid])  
    end

    def set_interview
      @interview = Interview.find(params[:iid])
    end

    def interview_params
      params.require(:interview).permit( :position_title, :follow_up_email, :interview_time, :listing_id, :interviewtype, :interviewed, :notes, :status)
    end
end

# create_table "interviews", force: :cascade do |t|
# t.integer  "user_id"
# t.string   "position_title"
# t.string   "follow_up_email"
# t.datetime "interview_time"
# t.datetime "created_at",                      null: false
# t.datetime "updated_at",                      null: false
# t.integer  "listing_id"
# t.string   "interviewtype"
# t.boolean  "interviewed",     default: false
# t.text     "notes"
# t.string   "status"


class ResumesController < ApplicationController
  before_action :authenticate_user_from_token!

  def create
    @resume = current_user.resumes.create(resume_params)
    render json: {message: "It worked yo!"}, status: :created
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :document)
  end

  # def index
  # end

  # def show
  # end

  # def destroy
  # end
end

class Staff::RecruitmentsController < ApplicationController

  def index
    @recruitments = Recruitment.all
    @recruitment = Recruitment.new
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruitment_form = RecruitmentForm.new
  end

end

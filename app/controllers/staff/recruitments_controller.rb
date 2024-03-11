class Staff::RecruitmentsController < ApplicationController

  def index
    @recruitments = Recruitment.all
    @recruitment = Recruitment.new

    if params[:tag_name]
      @recruitments = []
      params[:tag_name].each do |key, value|
        @recruitments += Tag.find_by(tag_name: key).recruitments if value == "1"
      end
      @recruitments.uniq!
    end
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruitment_form = RecruitmentForm.new
    @company = Company.find(@recruitment.company_id)
  end

end

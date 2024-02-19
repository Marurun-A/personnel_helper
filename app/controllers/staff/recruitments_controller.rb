class Staff::RecruitmentsController < ApplicationController

  def index
    @recruitments = Recruitment.all
    @recruitment = Recruitment.new
    if params[:tag_ids]
      @recruitments = []
      params[:tag_ids].each do |key, value|
        @recruitments += Tag.find_by(name: key).recruitments if value == "1"
      end
      @recruitments.uniq!
    end
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruitment_form = RecruitmentForm.new
  end

end

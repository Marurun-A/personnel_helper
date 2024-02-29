class Company::RecruitmentsController < ApplicationController
  def new
    @recruitments = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.company_id = current_company.id
    tag_list = params[:recruitment][:tag_name].split(',') | params[:recruitment][:tag_ids].compact_blank
    if @recruitment.save
      @recruitment.save_tags(tag_list)
      flash[:notice] = "You have created recruitment successfully."
      redirect_to company_recruitments_path(current_company)
    else
      @recruitments = Recruitment.all
      redirect_to company_requests_path
    end
  end

  def index
    @recruitments = Recruitment.where(company_id: params[:company_id])
    @tag_list = Tag.where(company_id: params[:company_id])
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @tag_list = @recruitment.tags.pluck(:tag_name).join(',')
    @recruitment_tags = @recruitment.tags
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
    @tag_list = @recruitment.tags.pluck(:tag_name).join(',')
  end

  def update
      @recruitment = Recruitment.find(params[:id])
      tag_name = params[:recruitment][:tag_name]
      tag_ids = params[:recruitment][:tag_ids]

      if tag_name.present? && tag_ids.present?
        tag_list = tag_name.split(',') | tag_ids.compact_blank
      elsif tag_name.present?
        tag_list = tag_name.split(',')
      elsif tag_ids.present?
        tag_list = tag_ids.compact_blank
      else
        tag_list = []
      end

      if @recruitment.update(recruitment_params)
        @recruitment.save_tags(tag_list)
        flash[:notice] = "You have updated recruitment successfully."
        redirect_to company_recruitment_path(@recruitment)
      else
        render :edit
      end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to company_recruitments_path(current_company)
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:image, :name, :kana, :business, :introduction, :hourly_wage, :date, :start_time, :finish_time, :place, :contact_address)
  end

end

class Company::RecruitmentsController < ApplicationController
  before_action :is_matching_login_company, only: [:show, :edit, :update]

  def new
    @recruitments = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.company_id = current_company.id
    tag_list = params[:recruitment][:tag_name].split(',') | params[:recruitment][:tag_ids].compact_blank
    if @recruitment.save
      @recruitment.save_tags(tag_list)
      flash[:notice] = "正常に作成されました"
      redirect_to company_recruitments_path(current_company)
    else
      render action: :new
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
      @recruitment.company_id = current_company.id
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
        flash[:notice] = "正常に更新できました"
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
    params.require(:recruitment).permit(:image, :recruitment_name, :recruitment_kana, :business, :introduction, :hourly_wage, :start_date, :finish_date, :start_time, :finish_time, :place, :contact_address, :minimum_time)
  end

  def is_matching_login_company
    recruitment = Recruitment.find(params[:id])
    company_id = recruitment.company.id
    unless company_id == current_company.id
      redirect_to staff_recruitments_path
      return
    end
  end

end

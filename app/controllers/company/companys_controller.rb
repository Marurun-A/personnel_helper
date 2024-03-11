class Company::CompanysController < ApplicationController

  def top
     @companys = current_company
     @employments = Employment.where(company_id: current_company.id, employment_status: :waiting_for_reply)
    if @employments.empty?
    @employments = []
    else
    @employment_details = EmploymentDetail.find_by(employment_id: @employments.first.id)
    @request_id = @employment_details.request_id
    end

    @works = Work.where(company_id: current_company.id, work_status: :waiting_for_reply)
      if @works.empty?
        @works = []
      else
        @work_details = WorkDetail.find_by(work_id: @works.first.id)
        @recruitment_id = @work_details.recruitment_id
      end
  end

  def show
    @companys = Company.find(params[:id])
  end

  def unsubscribe
    @company = current_company

  end

  def withdraw
    @company = current_company
    @company.update(is_active: false)
    sign_out


      redirect_to company_root_path
  end

  def edit
    company = Company.find(params[:id])
    unless company.id == current_company.id
      redirect_to current_company
    end

    @company = Company.find(params[:id])
  end

  def update

    company = Company.find(params[:id])
    unless company.id == current_company.id
      redirect_to company_company_path
    end

    @company = Company.find(params[:id])
      if @company.update(company_params)
        flash[:notice] = "You have updated company successfully."
        redirect_to company_company_path(@company.id)
      else
        render :edit
      end
  end

  private

  def company_params
    params.require(:company).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end

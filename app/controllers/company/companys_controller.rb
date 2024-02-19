class Company::CompanysController < ApplicationController

  def top
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

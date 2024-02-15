class Company::CompanysController < ApplicationController

  def top
  end

  def show
    @companys = Company.find(params[:id])
  end

end

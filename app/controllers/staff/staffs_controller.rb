class Staff::StaffsController < ApplicationController
  def top
  end

  def show
    @staffs = Staff.find(params[:id])
  end
  
end

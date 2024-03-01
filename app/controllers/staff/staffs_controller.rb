class Staff::StaffsController < ApplicationController
  def top
    @works = Work.where(staff_id: current_staff.id)
    if @works.empty?
      @works = []
    else
      @work_details = WorkDetail.find_by(work_id: @works.first.id)
      @recruitment_id = @work_details.recruitment_id
    end

    @employments = Employment.where(staff_id: current_staff.id)
    if @employments.empty?
    @employments = []
    else
    @employment_details = EmploymentDetail.find_by(employment_id: @employments.first.id)
    @request_id = @employment_details.request_id
    end
  end

  def show
    @staffs = Staff.find(params[:id])
  end

  def unsubscribe
    @staff = current_staff

  end

  def withdraw
    @staff = current_staff
    @staff.update(is_active: false)
    sign_out


      redirect_to staff_root_path
  end

  def edit
    staff = Staff.find(params[:id])
    unless staff.id == current_staff.id
      redirect_to current_staff
    end

      @staff = Staff.find(params[:id])
  end

  def update

    staff = Staff.find(params[:id])
    unless staff.id == current_staff.id
      redirect_to staff_staff_path
    end

    @staff = Staff.find(params[:id])
      if @staff.update(staff_params)
        flash[:notice] = "You have updated staff successfully."
        redirect_to staff_staff_path(@staff.id)
      else
        render :edit
      end
  end

  private

  def staff_params
    params.require(:staff).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end

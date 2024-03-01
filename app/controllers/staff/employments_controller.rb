class Staff::EmploymentsController < ApplicationController

   def index
    @employments = Employment.where(staff_id: current_staff.id)
    if @employments.empty?
    @employments = []
    else
    @employment_details = EmploymentDetail.find_by(employment_id: @employments.first.id)
    @request_id = @employment_details.request_id
    end
  end

  def show
    @employment = Employment.find(params[:id])
    @employment_details = @employment.employment_details
  end

  def update_status
    @employment = Employment.find(params[:id])
    if @employment.update(employment_params)
      flash[:notice] = "注文ステータスを更新しました"
      redirect_to staff_employments_path(current_staff)
    else
      flash[:alert] = "注文ステータスの更新に失敗しました"
      redirect_to staff_employments_path(current_staff)
    end
  end

  def employment_params
    employment_status = params[:employment][:employment_status]
    params.require(:employment).permit(employment_status)
  end

end

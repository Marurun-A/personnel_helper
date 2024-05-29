class Company::WorksController < ApplicationController

  def index
    @works = Work.where(company_id: current_company.id)
      if @works.empty?
        @works = []
      else
        @work_details = WorkDetail.find_by(work_id: @works.first.id)
        @recruitment_id = @work_details.recruitment_id
      end
  end

  def show
    @work = Work.find(params[:id])
    @work_details = @work.work_details
  end

  def update_status
    @work = Work.find(params[:id])
    if @work.update(work_params)
      @staff = Staff.find(@work.staff_id)
      staff_notifications = @staff.staff_notifications.build(company_id: current_company.id, staff_notifiable_type: "Work", staff_notifiable_id: @work.id)
      staff_notifications.save
      flash[:notice] = "ステータスを更新しました"
      redirect_to company_works_path(current_company)
    else
      flash[:alert] = "ステータスの更新に失敗しました"
      redirect_to company_works_path(current_company)
    end
  end

  def work_params
    params.require(:work).permit(:work_status)
  end

end

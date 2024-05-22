class Staff::WorksController < ApplicationController

  def new
    @work = Work.new
    @work.company_id = params[:company_id].to_i
  end

  def create
    @work = current_staff.works.new(work_params)
    @work.company_id = current_staff.recruitment_forms.first.company_id
    @work.work_status = 0

    if  @work.save
        current_staff.recruitment_forms.each do |recruitment_form|
          @work_details = WorkDetail.new
          @work_details.work_id = @work.id
          @work_details.recruitment_id = recruitment_form.recruitment.id
          @work_details.total_payment_amount = @work.total_payment_amount
          @work_details.save
          @company = Company.find(@work.company_id)
          @staff_notification = @work.staff_notifications.build(staff_id: current_staff.id, staff_notifiable_type: "Work", staff_notifiable_id: @work.id, company_id: @company.id)
          @staff_notification.save
        end

      current_staff.recruitment_forms.destroy_all
      redirect_to  staff_works_complete_path
    else
      render action: :new
    end
  end

  def confirm
    @work = Work.new(work_params)
    @work.staff_id = current_staff.id
    if @work.valid?
      @recruitment_forms = current_staff.recruitment_forms
    else
      render action: :new
    end
  end

  def complete
  end

  def index
    @works = Work.where(staff_id: current_staff.id)
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


  private

  def work_params
    params.require(:work).permit(:staff_id, :company_id, :work_name, :work_kana, :response_deadline, :date, :start_time,  :finish_time, :hours, :transportation, :payment_method, :whereabouts, :introduction, :contact_address, :total_payment_amount, :work_status)
  end

end

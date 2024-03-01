class Company::EmploymentsController < ApplicationController

  def new
    @employments = Employment.new
  end

  def create
    @employment = Employment.new(employment_params)
    @employment.company_id = current_company.id
    @employment.staff_id = current_company.request_forms.first.staff_id
    @employment.employment_status = 0

    if  @employment.save
        current_company.request_forms.each do |request_form|
          @employment_details = EmploymentDetail.new
          @employment_details.employment_id = @employment.id
          @employment_details.request_id = request_form.request.id
          @employment_details.total_payment_amount = @employment.total_payment_amount
          @employment_details.save
          end

      current_company.request_forms.destroy_all
      redirect_to  company_employments_complete_path
    else
      render action: :new
    end
  end

  def confirm
      @employment = Employment.new(employment_params)
      @request_forms = current_company.request_forms
      @employment.company_id = current_company.id
      @employments = [@employment]
  end

  def complete
  end

  def index
    @employments = Employment.where(company_id: current_company.id)
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


  private

  def employment_params
  params.require(:employment).permit(:company_id, :staff_id, :employment_name, :employment_kana, :response_deadline, :date,  :start_time,  :finish_time, :hours, :hourly_wage, :payment_method, :place_of_employment, :introduction, :contact_address, :total_payment_amount, :employment_status)
  end




end

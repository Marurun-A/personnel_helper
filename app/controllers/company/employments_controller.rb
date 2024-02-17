class Company::EmploymentsController < ApplicationController

  def new
    @employments = Employment.new

  end

  def create
    @employment = Employment.new(employment_params)
    @employment.company_id = current_company.id
    @employment.save

    current_company.recruitment_forms.each do |recruitment_form|
      @employment_details = EmploymentDetail.new
      @employment_details.emproitment_id = request_form.request.id
      @employment_details.request_id = @request.id
      @employment_details.sarary =
      # @employment_details.number_of_times =
      @employment_details.save
      end

      current_company.request_forms.destroy_all
      redirect_to  comapny_requests_complete_path
  end

  def confirm
    @employment = Employment.new(employment_params)
      @request_forms = current_company.request_forms
      @request.campany_id = current_campany.id
  end

  def complete
  end

  def index
    @employments = Employment.where(campnay_id: current_campany.id)
    @employment_details = EmploymentDetail.find_by(employment_id: @employment.first.id)
  end

  def show
    @employment = Employment.find(params[:id])
    @employment_details = @employment.employment_details
  end


  private

  def employment_params
    params.require(:employtment).permit(:company_id, :response_deadline, :total_amount, :transportation_expenses, :payment_method)
  end


end

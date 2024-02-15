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
      @employment_details.emproitment_id =
      @employment_details.recruitment_id =
      @employment_details.sarary =
      @employment_details.number_of_times =
      @employment_details.save
      end

      current_company.ecruitment_forms.destroy_all
      redirect_to  comapny_recruitments_complete_path
  end

  def confirm
    @employment = Employment.new(employment_params)

      # if params[:order][:address_option] == "0"
      #   @order.postal_code = current_customer.postal_code
      #   @order.address = current_customer.address
      #   @order.name = current_customer.full_name
      # elsif params[:order][:address_option] == "1"
      #   # ship = Address.find(params[:order][:customer_id])
      #   # @order.postal_code = postal_code
      #   # @order.address = address
      #   # @order.delivery_name = name
      # elsif params[:order][:address_option] = "2"
      # #   @order.postal_code = params[:order][:postal_code]
      # #   @order.address = params[:order][:address]
      # #   @order.delivery_name = params[:order][:delivery_name]
      #   else
      #       render 'new'
      #   end

      @recruitment_forms = current_company.recruitment_forms
      @recruitment.campany_id = current_campany.id
  end

  def complete
  end

  def index
    @recruitmens = Recruitmen.where(campnay_id: current_campany.id)
    @recruitmen_details = RecruitmenDetail.find_by(recruitmen_id: @recruitmen.first.id)
  end

  def show
    @recruitmen = Recruitmen.find(params[:id])
    @recruitmen_details = @recruitmen.recruitmen_details
  end


  private

  def recruitmen_params
    params.require(:recruitmen).permit()
  end
end


end

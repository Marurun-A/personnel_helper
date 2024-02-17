class Company::RequestFormsController < ApplicationController

  def create
    @request_form = RequestForm.find_by(request_id: params[:request_form][:request_id])
    @request_form = RequestForm.new(request_form_params)
    @request_form.company_id = current_company.id
    @request_form.save
    redirect_to company_request_forms_path
  end

  def index
    @request_forms = RequestForm.all
    @requests = Request.all
  end

  def update
    @request_form = RequestForm.find(params[:id])
    unless @request_form.company_id == current_company.id
      redirect_to company_requests_path
      return
    end

    if @request_form.update(amount: params[:request_form][:amount].to_i)
      redirect_to company_request_forms_path
    else
      redirect_to company_requests_path
    end
  end

  def destroy
    request_form = RequestForm.find(params[:id])
    request_form.destroy
    redirect_to company_request_forms_path
  end

  def destroy_all
    current_company.request_forms.destroy_all
    redirect_to company_request_forms_path
  end

  private

    def request_form_params
      params.require(:request_form).permit(:amount, :request_id, :company_id)
    end

end

class Company::RequestFormsController < ApplicationController

  def create
    @request_form = RequestForm.new(request_form_params)
    @request_form.company_id = current_company.id

    request_id = request_form_params[:request_id].to_i
    registered_request_forms = current_company.request_forms

    if registered_request_forms.blank?
      @request_form.save
      redirect_to company_request_forms_path
    else
      flash[:notice] = "新しく依頼を送る場合は、依頼フォームの中身を空にするか、依頼を一度完了してからにしてください"
      redirect_to company_requests_path
    end

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

    if @request_form.update(datetime: params[:request_form][:datetime])
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
      params.require(:request_form).permit(:request_id, :company_id, :staff_id)
    end

end

class Staff::RecruitmentFormsController < ApplicationController

  def create
    @recruitment_form = RecruitmentForm.new(recruitment_form_params)
    @recruitment_form.staff_id = current_staff.id
    recruitment_id = recruitment_form_params[:recruitment_id].to_i
    registered_recruitment_forms = current_staff.recruitment_forms
    if registered_recruitment_forms.blank?
    @recruitment_form.save
      redirect_to staff_recruitment_forms_path
    else
      flash[:notice] = "新しく依頼を送る場合は、依頼フォームの中身を空にするか、依頼を一度完了してからにしてください"
      redirect_to staff_recruitments_path
    end
  end

  def index
    @recruitment_forms = RecruitmentForm.all
    @recruitments = Recruitment.all
  end

  def update
    @recruitment_form = RecruitmentForm.find(params[:id])
    unless @recruitment_form.staff_id == current_staff.id
      redirect_to staff_recruitments_path
      return
    end

    if @recruitment_form.update(datetime: params[:recruitment_form][:datetime])
      redirect_to staff_recruitment_forms_path
    else
      redirect_to staff_recruitments_path
    end
  end

  def destroy
    recruitment_form = RecruitmentForm.find(params[:id])
    recruitment_form.destroy
    redirect_to staff_recruitment_forms_path
  end

  def destroy_all
    current_staff.recruitment_forms.destroy_all
    redirect_to staff_recruitment_forms_path
  end

  private

    def recruitment_form_params
      params.require(:recruitment_form).permit(:recruitment_id, :staff_id, :company_id)
    end

end

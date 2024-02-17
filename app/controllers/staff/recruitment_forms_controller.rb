class Staff::RecruitmentFormsController < ApplicationController

  def create
    @recruitment_form = RecruitmentForm.find_by(recruitment_id: params[:recruitment_form][:recruitment_id])
    @recruitment_form = RecruitmentForm.new(recruitment_form_params)
    @recruitment_form.staff_id = current_staff.id
    @recruitment_form.save
    redirect_to staff_recruitment_forms_path
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

    if @recruitment_form.update(amount: params[:recruitment_form][:amount].to_i)
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
      params.require(:recruitment_form).permit(:amount, :recruitment_id, :staff_id)
    end

end

class Company::RecruitmentsController < ApplicationController
  def new
    @recruitments = Recruitment.new
  end

  def create

    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.company_id = current_company.id
    if @recruitment.save
      flash[:notice] = "You have created recruitment successfully."
      redirect_to company_requests_path
    else
      @recruitments = Recruitment.all
      redirect_to company_requests_path
    end
  end

  def index
    @recruitments = Recruitment.where(company_id: params[:company_id])
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
      if @recruitment.update(recruitment_params)
        flash[:notice] = "You have updated recruitment successfully."
        redirect_to company_recruitment_path(@recruitment)
      else
        render :edit
      end
  end

  def destroy
    recruitment = Recruitment.find(params[:id])
    recruitment.destroy
    redirect_to company_recruitment_path
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:image, :name, :kana, :business, :introduction, :hourly_wage, :date, :time, :place, :contact_address)
  end

end

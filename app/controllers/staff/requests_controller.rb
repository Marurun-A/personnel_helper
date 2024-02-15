class Staff::RequestsController < ApplicationController

  def new
    @requests = Request.new
  end

  def create

    @request = Request.new(request_params)
    @request.staff_id = current_staff.id
    if @request.save
      flash[:notice] = "You have created request successfully."
      redirect_to staff_recruitments_path
    else
      @requests = Request.all
      redirect_to staff_recruitments_path
    end
  end

  def index
    @requests = Request.where(staff_id: params[:staff_id])
  end

  def show
    @request = Request.find(params[:id])
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
      if @request.update(request_params)
        flash[:notice] = "You have updated request successfully."
        redirect_to staff_request_path(@request)
      else
        render :edit
      end
  end

  def destroy
    request = Request.find(params[:id])
    request.destroy
    redirect_to staff_request_path
  end

  private

  def request_params
    params.require(:request).permit(:image, :name, :kana, :business, :introduction, :date, :time, :place, :contact_address)
  end


end


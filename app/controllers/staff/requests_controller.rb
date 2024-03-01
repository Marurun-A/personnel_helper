class Staff::RequestsController < ApplicationController

  def new
    @requests = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.staff_id = current_staff.id
    tag_list = params[:request][:tag_name].split(',') | params[:request][:tag_ids].compact_blank
    if @request.save
      @request.save_tags(tag_list)
      flash[:notice] = "You have created request successfully."
      redirect_to staff_requests_path(current_staff)
    else
      @requests = Request.all
      render action: :new
    end
  end

  def index
    @requests = Request.where(staff_id: params[:staff_id])
    @tag_list = Tag.where(staff_id: params[:staff_id])
  end

  def show
    @request = Request.find(params[:id])
    @tag_list = @request.tags.pluck(:tag_name).join(',')
    @request_tags = @request.tags
  end

  def edit
    @request = Request.find(params[:id])
    @tag_list = @request.tags.pluck(:tag_name).join(',')
  end

  def update
    @request = Request.find(params[:id])
    tag_list=params[:request][:tag_name].split(',') | params[:request][:tag_ids].compact_blank
      if @request.update(request_params)
        @request.save_tags(tag_list)
        flash[:notice] = "You have updated request successfully."
        redirect_to staff_request_path(@request)
      else
        render :edit
      end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to staff_requests_path(current_staff)
  end

  private

  def request_params
    params.require(:request).permit(:image, :request_name, :request_kana, :business, :introduction, :date, :start_time, :finish_time, :place, :contact_address, :maximum_time)
  end


end


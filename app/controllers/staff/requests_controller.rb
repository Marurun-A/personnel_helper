class Staff::RequestsController < ApplicationController
   before_action :is_matching_login_staff, only: [:show, :edit, :update]

  def new
    @requests = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.staff_id = current_staff.id
    tag_list = params[:request][:tag_name].split(',') | params[:request][:tag_ids].compact_blank
    if @request.save
       @request.save_tags(tag_list)
       flash[:notice] = "正常に作成されました"
       redirect_to staff_requests_path(current_staff)
    else
       render :new
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
      @request.staff_id = current_staff.id
      tag_name = params[:request][:tag_name]
      tag_ids = params[:request][:tag_ids]

      if tag_name.present? && tag_ids.present?
        tag_list = tag_name.split(',') | tag_ids.compact_blank
      elsif tag_name.present?
        tag_list = tag_name.split(',')
      elsif tag_ids.present?
        tag_list = tag_ids.compact_blank
      else
        tag_list = []
      end

      if @request.update(request_params)
        @request.save_tags(tag_list)
        flash[:notice] = "正常に更新できました"
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
    params.require(:request).permit(:image, :request_name, :request_kana, :business, :introduction, :start_date, :finish_date, :start_time, :finish_time, :place, :contact_address, :maximum_time)
  end

  def is_matching_login_staff
    request = Request.find(params[:id])
    staff_id = request.staff.id
    unless staff_id == current_staff.id
      redirect_to company_requests_path
      return
    end
  end


end
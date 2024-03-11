class Company::RequestsController < ApplicationController

  def index
    @requests = Request.all
    @request = Request.new

    if params[:tag_name]
      @requests = []
      params[:tag_name].each do |key, value|
        @requests += Tag.find_by(tag_name: key).requests if value == "1"
      end
      @requests.uniq!
    end
  end

  def show
    @request = Request.find(params[:id])
    @request_form = RequestForm.new
    @staff = Staff.find(@request.staff_id)
  end

end

class Company::RequestsController < ApplicationController

  def index
    @requests = Request.all
    @request = Request.new
  end

  def show
    @request = Request.find(params[:id])
    @request_form = RequestForm.new
  end

end

class Company::HomesController < ApplicationController

  before_action :authenticate_company!, except: [:top]

end

class Company::HomesController < ApplicationController

  before_action :authenticate_company!, except: [:top, :confirm_registration, :confirm_session]

    def top

    end

    def confirm_registration
    end

    def confirm_session
    end

  end

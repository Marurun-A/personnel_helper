class Staff::HomesController < ApplicationController

  before_action :authenticate_staff!, except: [:top]

end

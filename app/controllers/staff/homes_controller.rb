class Staff::HomesController < ApplicationController

  before_action :authenticate_staff!, except: [:top]

    def top

    end

end

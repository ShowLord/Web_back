class CalendarsController < ApplicationController
  before_action :login_required
  def create(params)
    respond_to do |format|
      user = User.find(email: params[:collaborator])
      if user.calendars.create(name: params[:name], color: params[:color])
        format.json { render json: user.calendars, status: 'success' }
      else
        format.json { render json: @body, status: 'false' }
      end
    end
  end
end

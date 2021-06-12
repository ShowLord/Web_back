class UsersController < ApplicationController
  def index(params)
    respond_to do |format|
      if User.find_by(email: params[:email]).present?
        current_user = User.find_by(email: params[:email])
        @body = UserApi::UserData.new.user_data(current_user)
        format.json { render json: @body, status: 'success' }
        @calendars = current_user.calendars
        format.json { render json: @calendars, status: 'success' }
      else
        format.json { render json: current_user, status: 'false' }
      end
    end
  end

  def create(params)
    @new_user = User.new(params)
    respond_to do |format|
      if new_user.save
        format.json { render json: @new_user, status: 'success' }
      else
        format.json { render json: @new_user.errors, status: 'false' }
      end
    end
  end
end

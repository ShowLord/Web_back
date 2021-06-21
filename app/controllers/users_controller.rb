class UsersController < ApplicationController
  def index(params)
    respond_to do |format|
      user = User.login(params[:user])
      if user
        @body = UserApi::UserData.new.user_data(user)
        session[:user9527] = user.id
        format.json { render json: @body, status: 'success', session: session[:user9527] }
        @calendars = user.calendars
        format.json { render json: @calendars, status: 'success' }
      else
        format.json { render json: user, status: 'false' }
      end
    end
  end

  def create
    @new_user = User.new(user_params)
    respond_to do |format|
      if @new_user.save
        format.json { render json: @new_user, status: 'success' }
      else
        format.json { render json: @new_user.errors, status: 'false' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :avatar_url)
  end
end

class ApplicationController < ActionController::Base
  include LoginHelper

  private
  def login_required
    redirect_to sign_in_users_path, notice: '請先登入會員' unless user_signed_in?
  end
end

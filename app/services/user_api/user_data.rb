class UserApi::UserData
  def initialize
    @factory = User::UserFactory.new
  end

  def user_data(current_user)
    params = @factory.create_user_params(current_user)
    CyberbizApi::SendNotification.new('create', params).create_execute
  end
end

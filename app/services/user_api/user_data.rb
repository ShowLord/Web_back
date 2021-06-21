class UserApi::UserData
  def initialize
    @factory = User::UserFactory.new
  end

  def user_data(user)
    params = @factory.create_user_params(user)
    return params
  end
end

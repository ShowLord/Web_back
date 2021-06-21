class User::UserFactory
  def create_user_params(user)
    {
      user_id: user.id,
      name: user.name,
      email: user.email,
      avatar_url: user.avatar_url
    }
  end
end

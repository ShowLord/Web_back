class User::UserFactory
  def user_dat(current_user)
    {
      user_id: current_user.id,
      name: current_user.name,
      email: current_user.email,
      avatar_url: current_user.avatar_url
    }
  end
end

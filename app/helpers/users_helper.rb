module UsersHelper
  def link_to_user(user)
    if user
      link_to user.username, user_path(user)
    else
      'Retired User'
    end
  end
end

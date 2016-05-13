module ApplicationHelper
  def sign_in_hide
    unless user_signed_in?
      raw("style='display: none;'")
    end
  end
  def log_out_hide
    if user_signed_in?
      raw("style='display: none;'")
    end
  end
  def profile_button
    if user_signed_in?
      link_to 'Profile', users_show_path(current_user.id)
    end
  end
end

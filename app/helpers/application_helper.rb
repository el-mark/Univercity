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
  def if_current_user_name
    if user_signed_in?
      current_user.name
    end
  end
end

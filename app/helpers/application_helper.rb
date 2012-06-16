module ApplicationHelper
  private
  def user_logged_in
    session['user_attributes']
  end

  def user_role
    if user_logged_in
      session['user_attributes']['role']
    else
      nil
    end
  end

  def user_name
    if user_logged_in
      session['user_attributes']['name']
    else
      nil
    end
  end

  def user_id
    if user_logged_in
      session['user_attributes']['id']
    else
      nil
    end
  end

  def user_in_role(role)
    attrs = session['user_attributes']
    attrs && attrs['role'] == role
  end

end

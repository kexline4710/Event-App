helpers do
  def current_user
    User.find(session[:user_id])
  end

  def user_logged_in?
    session[:user_id]
  end

  # def authenticate(password)
  #   self.password_digest == password
  # endß
end

get '/' do
  # Look in app/views/index.erb
  @events = Event.all
  if session[:user_id]
    @user = User.find(session[:user_id])
    @created = @user.created_events
    @attended = @user.attended_events
    hash = Digest::MD5.hexdigest(@user.email.downcase)
    @image = "http://www.gravatar.com/avatar/#{hash}"
  end
  erb :index
end


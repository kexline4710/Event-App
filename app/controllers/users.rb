get '/login' do
  erb :login
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to '/profile'
  else
    session[:errors] = "Incorrect login credentials"
    redirect to '/login'
  end
end

post '/users' do
  user = User.create(params[:new])
  if user.save
    session[:user_id] = user.id
    redirect to '/'
  else
    redirect '/login'
  end
end

post '/logout' do
  session.clear
  redirect to '/'
end

get '/profile' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @created = @user.created_events
    @attended = @user.attended_events
    hash = Digest::MD5.hexdigest(@user.email.downcase)
    @image = "http://www.gravatar.com/avatar/#{hash}"
  end
  erb :profile
end


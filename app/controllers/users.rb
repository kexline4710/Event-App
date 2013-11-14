get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by_email(params[:email])
  if user
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/'
    else
      session[:errors] = "Password incorrect!"
      redirect to '/login'
    end
  else
    session[:errors] = "Cannot find record of email!"
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
  end
  erb :profile
end


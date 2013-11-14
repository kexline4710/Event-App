require 'json'

get '/events/:id' do
  @event = Event.find(params[:id])
  @creator = @event.user
  @attendances = @event.event_attendances
  erb :event 
end

get '/events/new/' do
  if session[:user_id]
    erb :new_event
  else
    redirect to '/login'
  end
end

post '/events' do
  @user = User.find(session[:user_id])
  event = @user.events.create(params[:new])
  # redirect to '/'
  content_type :json
  {id: event.id, name: event.name}.to_json
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])
  erb :event_edit 
end

post '/events/:id' do
  @event = Event.find(params[:id])
  @event.update_attributes(params[:new])
  @event.save
  redirect to "/events/#{@event.id}"
end

post '/events/:id/delete' do
  Event.destroy(params[:id])
  redirect to '/'
end

post '/events/:id/eventattendances' do
  @event = Event.find(params[:id])
  @event.event_attendances.find_or_create_by_user_id(current_user.id)
  redirect to "/events/#{@event.id}"
end

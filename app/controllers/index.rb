get '/' do
  # Look in app/views/index.erb
  @events = Event.all
  erb :index
end


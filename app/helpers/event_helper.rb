helpers do
  def display_start_time(event)
    Time.at(event.starts_at.to_i).strftime("%B %e, %Y at %I:%M %p")
  end

  def display_end_time(event)
    Time.at(event.ends_at.to_i).strftime("%B %e, %Y at %I:%M %p")
  end

end

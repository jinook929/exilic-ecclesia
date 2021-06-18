module EventsHelper
  def date_time_display
    "#{@event.date} @ #{@event.time.strftime('%l:%M %p')}"
  end

  def disabled_attr
    'disabled' if (@event.open?.include?("closed") || @event.users.include?(current_user))
  end
end

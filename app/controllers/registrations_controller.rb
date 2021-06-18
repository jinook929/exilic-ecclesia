class RegistrationsController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def new
    @event = Event.find_by(id: params[:event_id])
    if @event.open?.include?("closed")
      redirect_to @event
    end
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(event_id: params[:event_id], user_id: current_user.id, family: params[:registration][:family])
    if @registration.save
      redirect_to user_events_path(current_user)
    else
      @event = Event.find_by(id: params[:event_id])
      render 'new'
    end
  end

  def edit
    @registration = Registration.find_by(id: params[:id])
    @event = Event.find_by(id: params[:event_id])
    redirect_to current_user, alert: "Registration Failed." if !(registration_owned? || current_user.admin) || (@registration.event != @event)
  end

  def update
    @registration = Registration.find_by(event_id: params[:event_id], user_id: current_user.id)
    @registration.update(family: params[:registration][:family])
    redirect_to user_event_path(current_user, @registration.event)
  end

  def destroy
    if registration_owned?
      registration = Registration.find_by(id: params[:id])
      registration.event.spots += 1
      registration.event.save
      registration.destroy
      redirect_to user_events_path(current_user)
    else
      redirect_back fallback_location: user_path(current_user)
    end
  end
end

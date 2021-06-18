class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update ,:destroy]
  before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_if_not_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @events = User.find_by(id: params[:user_id]).events.order(date: :desc, time: :desc)
    else
      @events = Event.all.order(date: :desc, time: :desc)
    end
  end

  def show
    redirect_to events_path if @event.nil?
    @registration = Registration.find_by(event_id: params[:id], user_id: params[:user_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.toggle(:onsite) if params[:event][:onsite]
    if @event.save
      redirect_to @event, alert: "Event Successfully Created!"
    else
      @alert = "Please fill in all the boxex."
      @errors = @event.errors.full_messages
      render 'new'
    end
  end

  def edit    
  end

  def update    
    @event.update(event_params)
    @event.toggle(:onsite) if (params[:event][:onsite].nil? && @event.onsite) || (params[:event][:onsite] && !@event.onsite)
    if @event.save
      redirect_to @event, alert: "Event Successfully Created!"
    else
      @alert = "Please fill in all the boxex."
      @errors = @event.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def full
    @events = Event.all.select {|event| event.open?.include?("closed")}

    render 'index'
  end

  def onsite
    @events = Event.onsite_events
    @note = "On-Site"
    render "event_type"
  end

  def virtual
    @events = Event.virtual_events
    @note = "Virtual"
    render "event_type"
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])
  end


  def event_params
    params.require(:event).permit(:title, :date, :time, :spots, :description)
  end
end

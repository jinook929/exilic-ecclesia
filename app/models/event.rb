class Event < ApplicationRecord
  has_many :registrations, dependent: :delete_all
  has_many :users, through: :registrations

  validates_presence_of :title, :date, :time, :description, :spots

  scope :registered?, ->(event, user) { Registration.where("event_id = ? AND user_id = ?", event.id, user.id) }
  scope :onsite_events, ->() { where(onsite: true).order(date: :desc, time: :desc) }
  scope :virtual_events, ->() { where(onsite: false).order(date: :desc, time: :desc) }

  def open?
    if self.spots > 0
      "Remaining Seats: #{self.spots}"
    else
      "The registration for this event is closed."
    end
  end
end

class Registration < ApplicationRecord
  before_create :register

  belongs_to :user
  belongs_to :event
  
  private

  def register
    self.event.spots -= 1
    self.event.save
  end
end

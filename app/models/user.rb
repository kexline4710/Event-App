class User < ActiveRecord::Base

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@\w+.\w+/ }

  has_many :events
  has_many :event_attendances

  def created_events
    self.events
  end

  def attended_events
    self.event_attendances.map {|attendance| attendance.event}
  end

end
